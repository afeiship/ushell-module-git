#!/usr/bin/env bash

gr() {
    if [ $# -eq 0 ]; then
        # 作用于当前目录，丢弃所有本地变更（包括已暂存的）
        git restore --source=HEAD --staged --worktree -- .
    else
        # 作用于指定路径，丢弃所有本地变更（包括已暂存的）
        git restore --source=HEAD --staged --worktree -- "$@"
    fi
}