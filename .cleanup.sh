#!/data/data/com.termux/files/usr/bin/bash

echo "[+] Cleanup running..."

# 1. Dọn history
history -c 2>/dev/null
> ~/.bash_history 2>/dev/null

# 2. Load whitelist
mapfile -t WHITELIST < ~/.whitelist
is_whitelisted() {
  for w in "${WHITELIST[@]}"; do
    [[ "$1" == $w* ]] && return 0
  done
  return 1
}

# 3. Load blacklist
mapfile -t BLACKLIST < ~/.blacklist
for entry in "${BLACKLIST[@]}"; do
  for target in $(find ${entry} 2>/dev/null); do
    is_whitelisted "$target" || {
      size=$(stat -c%s "$target" 2>/dev/null)
      [[ "$size" =~ ^[0-9]+$ ]] && dd if=/dev/urandom of="$target" bs=1 count=$size status=none
      rm -rf "$target"
    }
  done
done

# 4. Dọn cache, viminfo, backup
rm -rf ~/.cache ~/.viminfo ~/.bash_history* 2>/dev/null

# 5. Fake log
mkdir -p ~/logs && echo "[INFO] No suspicious activity detected." > ~/logs/fake.log

exit 0
