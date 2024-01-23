#!/usr/bin/env bash

# 1. get subdirectory name
subdir=$(ls -d */ | awk '{printf $1}')
# 2. remove .git directory
cd $subdir && rm -rf .git && cd ..
# 3. move all files to parent directory
mv $subdir/{*,.[^.]*} .
# 4. remove subdirectory
rm -rf $subdir
