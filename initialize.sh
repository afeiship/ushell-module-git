#!/usr/bin/env bash
## path:
ROOT_PATH=$(dirname $BASH_SOURCE);

git config --global user.email "1290657123@qq.com";
git config --global user.name "feizheng";

## chinese encoding problem: http://www.cnblogs.com/Jerryshome/archive/2012/04/19/2457139.html
git config --global core.quotepath false;

##ignore output:
ssh-add ~/.ssh/id_rsa.github.com >/dev/null 2>/dev/null;


