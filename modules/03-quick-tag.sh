#!/usr/bin/env bash
PWD=$0;
TAG=$1;
MSG=$2;

git tag -a "$TAG" -m "$MSG";
git push origin --tags;