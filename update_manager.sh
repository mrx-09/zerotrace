#!/data/data/com.termux/files/usr/bin/bash

# THAY dòng này bằng repo thật của bạn
REPO_URL="https://raw.githubusercontent.com/yourusername/zerotrace/main"

FILES=(
  ".cleanup.sh"
  ".whitelist"
  ".blacklist"
  "secure_run.sh"
  "kill_all.sh"
)

for f in "${FILES[@]}"; do
  echo "[+] Cập nhật: $f"
  curl -fsSL "$REPO_URL/$f" -o "$HOME/$f" && chmod +x "$HOME/$f"
done

echo "[✓] Đã cập nhật toàn bộ hệ thống."
