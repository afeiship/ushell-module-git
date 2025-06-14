#!/usr/bin/env bash

# 检查是否提供了分支名称作为第一个参数
if [ -z "$1" ]; then
  echo "Usage: $0 <branch_name> [default_branch]"
  exit 1
fi

# 获取分支名称和默认分支名称
BRANCH_NAME=$1
DEFAULT_BRANCH=${2:-main} # 如果没有提供第二个参数，默认为 main

# 切换到默认分支
echo "Switching to default branch ($DEFAULT_BRANCH)..."
git checkout $DEFAULT_BRANCH || { echo "Failed to switch to $DEFAULT_BRANCH branch"; exit 1; }

# 检查本地分支是否存在
if git show-ref --quiet --verify refs/heads/$BRANCH_NAME; then
  echo "Deleting local branch ($BRANCH_NAME)..."
  git branch -D $BRANCH_NAME || { echo "Failed to delete local branch $BRANCH_NAME"; exit 1; }
else
  echo "Local branch '$BRANCH_NAME' does not exist. Skipping local deletion."
fi

# 删除远程分支
echo "Deleting remote branch ($BRANCH_NAME)..."
git push origin --delete $BRANCH_NAME || { echo "Failed to delete remote branch $BRANCH_NAME"; exit 1; }

echo "Branch '$BRANCH_NAME' has been successfully deleted locally and remotely."