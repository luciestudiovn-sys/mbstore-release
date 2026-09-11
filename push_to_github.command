#!/bin/bash
# Script tự động đẩy toàn bộ APK và apps.json lên repo Public mb-releases
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

echo "=========================================================="
echo "    🚀 ĐẨY BẢN RELEASE LÊN GITHUB PUBLIC (mb-releases)    "
echo "=========================================================="
echo ""

if [ ! -d ".git" ]; then
    git init
    git branch -M main
fi

git add .
git commit -m "Release MB2AUTO v2.6.1-v1 and MB Store v1.0.1"
# Check remote
if ! git remote | grep -q 'origin'; then
    git remote add origin https://github.com/luciestudiovn-sys/mbstore-release.git
fi

echo " Đang đẩy file APK và apps.json lên GitHub..."
git push -u origin main --force

echo ""
echo "✅ Hoàn tất! Kho phân phối public đã được cập nhật."
read -p "Nhấn [Enter] để thoát..."
