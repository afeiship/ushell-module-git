#!/usr/bin/env bash

# 检查是否传入了目标提交
if [ -z "$1" ]; then
    echo "Usage: git-fixup-rebase <target-commit>"
    return 1
fi

# 获取目标提交
TARGET_COMMIT=$1

# 找到目标提交的上一条提交
BASE_COMMIT=$(git rev-parse $TARGET_COMMIT^)

# 如果没有找到上一条提交，提示错误
if [ -z "$BASE_COMMIT" ]; then
    echo "Error: Could not find the parent commit of $TARGET_COMMIT."
    return 1
fi

# 执行交互式变基
git add .
git commit --fixup=$TARGET_COMMIT
git rebase -i --autosquash $BASE_COMMIT