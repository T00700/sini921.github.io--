#!/bin/bash

if [ ! -f "./Assets.car" ]; then
    echo "错误：未找到要解压的文件 Assets.car"
    exit 1
fi

echo "正在解压，请稍候..."

uncar ./Assets.car ./Assets

if [ $? -ne 0 ]; then
    echo "错误：解压失败，请检查文件或工具"
    exit 1
fi

if [ ! -d "./Assets" ]; then
    echo "错误：解压后未找到目标文件夹 Assets"
    exit 1
fi

echo "解压完成"