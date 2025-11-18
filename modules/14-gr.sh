#!/usr/bin/env bash

gr() {
    if [ $# -eq 0 ]; then
        echo "Usage: gr <file...>" >&2
        return 1
    fi
    
    git checkout -f -- "$@"
}