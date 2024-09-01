#!/usr/bin/env bash


# 如果提供了参数，使用参数；否则使用 'dev' 作为默认值
BASE_BRANCH=${1:-dev}

# 打开 GitHub 对比页面
open "https://github.com/applyai-dev/applyai-frontend/compare/$BASE_BRANCH...$(git branch --show-current)?expand=1"
