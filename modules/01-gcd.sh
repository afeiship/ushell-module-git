#!/usr/bin/env bash
GIT_URL=$1;
git clone $GIT_URL && cd $(basename $_ .git)