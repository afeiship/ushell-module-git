#!/usr/bin/env bash

# Delete local tags
git tag -l | xargs git tag -d

# Delete remote tags
git ls-remote --tags | awk '{print $2}' | sed 's/refs\/tags\///' | xargs -n 1 git push --delete origin

# Delete remote releases
gh release list | awk '{print $2}' | xargs -n 1 gh release delete --yes
