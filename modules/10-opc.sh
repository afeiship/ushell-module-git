#!/usr/bin/env bash

# GIT_URL: git@github.com:afeiship/ushell-module-git.git
GIT_URL=$(git config --get remote.origin.url)

# 从 GIT_URL 中 获取 applyai-dev/applyai-frontend 
REPO_PATH=$(echo "$GIT_URL" | awk -F'[:/]' '{print $(NF-1)"/"$NF}' | cut -d '.' -f 1)

# 获取当前分支名称
CURRENT_BRANCH=$(git branch --show-current)

# 打开 GitHub 对比页面
open "https://github.com/$REPO_PATH/commits/$CURRENT_BRANCH"