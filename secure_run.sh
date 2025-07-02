#!/data/data/com.termux/files/usr/bin/bash

# Kiểm tra input
[[ -f "$1" ]] || { echo "[!] Script không tồn tại."; exit 1; }

# Thực thi script
bash "$1" > /dev/null 2>&1

# Tự động cleanup và cập nhật
bash ~/.cleanup.sh
bash ~/.update_manager.sh
