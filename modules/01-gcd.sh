#!/usr/bin/env bash
GIT_URL=$1;
dir=`basename $GIT_URL .git`;

if [ -d $dir ]; then
    cd $dir && git pull;
else
    git clone $GIT_URL && cd $dir;
fi