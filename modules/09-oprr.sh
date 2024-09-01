#!/usr/bin/env bash

# 如果提供了参数，使用参数；否则使用 'dev' 作为默认值
BASE_BRANCH=${1:-dev}

# GIT_URL: git@github.com:afeiship/ushell-module-git.git
GIT_URL=$(git config --get remote.origin.url)

# 从 GIT_URL 中 获取 applyai-dev/applyai-frontend 
PROJECT_NAME=$(echo $GIT_URL | awk -F'/' '{print $4}')

# 获取当前分支名称
CURRENT_BRANCH=$(git branch --show-current)

# 打开 GitHub 对比页面
open "https://github.com/$PROJECT_NAME/compare/$BASE_BRANCH...$CURRENT_BRANCH?expand=1"
