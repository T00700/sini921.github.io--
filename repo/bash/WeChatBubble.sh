#!/bin/bash

echo "气泡生成中，请稍等……"

declare -A file_map=(
  ["气泡左.png"]="ChatRoom_Bubble_Text_Receiver_White@3x.png ChatRoom_Bubble_Text_Receiver_White_HL@3x.png"
  ["气泡左黑.png"]="ChatRoom_Bubble_Text_Receiver_Dark@3x.png ChatRoom_Bubble_Text_Receiver_Dark_HL@3x.png"
  ["气泡右.png"]="ChatRoom_Bubble_Text_Sender_Green@3x.png ChatRoom_Bubble_Text_Sender_Green_HL@3x.png"
  ["气泡右黑.png"]="ChatRoom_Bubble_Text_Sender_Green_Dark@3x.png ChatRoom_Bubble_Text_Sender_Green_HL_Dark@3x.png"
  ["app右.png"]="ChatRoom_Bubble_App_Sender@3x.png"
  ["app右黑.png"]="ChatRoom_Bubble_App_Sender_Dark@3x.png"
  ["红包左.png"]="ChatRoom_Bubble_HB_Receiver@3x.png ChatRoom_Bubble_HB_Receiver_Handled@3x.png"
  ["红包左黑.png"]="ChatRoom_Bubble_HB_Receiver_Dark@3x.png ChatRoom_Bubble_HB_Receiver_Handled_Dark@3x.png"
  ["红包右.png"]="ChatRoom_Bubble_HB_Sender@3x.png ChatRoom_Bubble_HB_Sender_Handled@3x.png"
  ["红包右黑.png"]="ChatRoom_Bubble_HB_Sender_Dark@3x.png ChatRoom_Bubble_HB_Sender_Handled_Dark@3x.png"
)

processed_sources=()

for source_file in "${!file_map[@]}"; do
  if [ -f "$source_file" ]; then
    IFS=' ' read -r -a targets <<< "${file_map[$source_file]}"
    for target_file in "${targets[@]}"; do
      cp "$source_file" "$target_file"
    done
    rm "$source_file"
    processed_sources+=("${source_file%.png}") 
  else
    echo "文件 $source_file 不存在，跳过"
  fi
done

if [ "${#processed_sources[@]}" -gt 0 ]; then
  echo "已生成以下气泡："
  for source in "${processed_sources[@]}"; do
    echo "  已生成 $source"
  done
else
  echo "没有生成任何气泡"
fi

echo "操作完成"