#!/bin/bash

RED='\033[38;5;196m'
NC='\033[0m'

echo "清理缓存中，请稍候..."

total_freed_space=0

calculate_size() {
  du -sk "$1" 2>/dev/null | cut -f1
}

free_space() {
  local dir_size
  dir_size=$(calculate_size "$1")
  rm -rf "$1"/*
  new_size=$(calculate_size "$1")
  freed_space=$((dir_size - new_size))
  total_freed_space=$((total_freed_space + freed_space))
  echo -e "正在清理 $1 ，已清理 ${RED}$((freed_space / 1024))MB${NC}"
}

directories=(
    "/var/containers/Data/System/1C1C99AC-39CF-4706-8CBC-C278C12F9FDB/Library/Caches/com.apple.PaperBoardUI"
    "/var/MobileAsset/AssetsV2"
    "/var/db/uuidtext"
    "/var/db/diagnostics/Persist"
    "/var/db/diagnostics/Signpost"
    "/var/db/diagnostics/Special"
    "/var/mobile/Library/Caches"
)

for directory in "${directories[@]}"; do
    if [ -d "$directory" ]; then
        free_space "$directory"
    else
        echo "目录不存在: $directory"
    fi
done

echo "缓存清理完成。"
echo -e "总共释放空间: ${RED}$((total_freed_space / 1024))MB${NC}"
exit 0