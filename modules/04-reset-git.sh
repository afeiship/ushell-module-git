#!/usr/bin/env bash

## input your git url:
GIT_URI=$1;

# Step 1: remove all history
rm -rf .git;

# Step 2: reconstruct the Git repo with only the current content
git init;
git add --all;
git commit -m "Initial commit";

# Step 3: push to GitHub.
git remote add origin $GIT_URI;
git push -u --force origin master;
