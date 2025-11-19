#!/usr/bin/env bash

gr() {
    # 当没有传值的时候，即为 "."
    if [ $# -eq 0 ]; then
        git checkout -f -- .
    else
        git checkout -f -- "$@"
    fi
}