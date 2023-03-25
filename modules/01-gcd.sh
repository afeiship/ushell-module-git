#!/usr/bin/env bash
GIT_URL=$1;
dir=`basename $GIT_URL .git`;
orgname=`echo $GIT_URL | awk -F [:/] '{print$2}'`;

# A special case for `afeiship` org.
if [ $orgname == 'afeiship' ]; then
    orgname='github';
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