#!/usr/bin/env bash
## path:
ROOT_PATH=$(pwd);

git config --global user.email "1290657123@qq.com";
git config --global user.name "feizheng";

##ignore output:
ssh-add ~/.ssh/id_rsa.github.com >/dev/null 2>/dev/null;
