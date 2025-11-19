#!/usr/bin/env bash
# AI: https://chat.qwen.ai/c/50e0a481-e4d1-4302-927e-0d2938ee04e8
# Git 忽略文件函数（不添加到 .gitignore）
git_ignore_file() {
    local file="$1"
    
    if [ -z "$file" ]; then
        echo "错误: 请提供要忽略的文件名"
        echo "用法: git_ignore_file <文件名>"
        return 1
    fi
    
    if [ ! -f "$file" ]; then
        echo "错误: 文件 $file 不存在"
        return 1
    fi
    
    # 先添加文件（如果尚未添加）
    git add -N "$file" 2>/dev/null || true
    
    # 使用 assume-unchanged 标记文件
    if git update-index --assume-unchanged "$file"; then
        echo "已设置 $file 为忽略状态"
        echo "提示: 使用 git_unignore_file '$file' 取消忽略"
    else
        echo "错误: 无法设置 $file 为忽略状态"
        return 1
    fi
}

# 取消忽略文件函数
git_unignore_file() {
    local file="$1"
    
    if [ -z "$file" ]; then
        echo "错误: 请提供要取消忽略的文件名"
        echo "用法: git_unignore_file <文件名>"
        return 1
    fi
    
    # 取消 assume-unchanged 标记
    if git update-index --no-assume-unchanged "$file"; then
        echo "已取消 $file 的忽略状态"
    else
        echo "错误: 无法取消 $file 的忽略状态"
        return 1
    fi
}