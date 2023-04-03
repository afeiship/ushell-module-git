#!/usr/bin/env bash
GIT_URL=$1;
dir=`basename $GIT_URL .git`;
orgname=`echo $GIT_URL | awk -F [:/] '{print$2}'`;
repourl=`echo $GIT_URL | awk -F [:/] '{print$1}'`;

# A special case for nono `aric-` org.
if [[ $orgname != "aric-"* ]]; then
    orgname="github";
fi

if [[ $repourl == 'git@git.saybot.net' ]]; then
    orgname="saybot";
fi

localdir="$HOME/$orgname/$dir";

# test local dir,  if exists, cd to it and pull, else mkdir and clone
if [ -d $localdir ]; then
    cd $localdir && git pull;
else
    subdir=`dirname $localdir`;
    mkdir -p $subdir && cd $subdir;
    git clone $GIT_URL && cd $dir;
fi