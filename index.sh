#!/usr/bin/env bash
## path:
ROOT_PATH=$(dirname $BASH_SOURCE);

## git base:
alias gl='git pull';
alias gp='git push';
alias glo='git pull origin ';
alias gpo='git push origin ';
alias gaa='git add -A';
alias gcm='git commit -m ';
alias goo='git checkout origin ';
alias gc='git clone';


## git revert:
alias gr='git checkout -f';
alias go='git checkout ';

## git others:
alias gs='git status ';
alias ga='git add ';
alias gb='git branch ';
alias gd='git diff';
alias gk='gitk --all&';
alias gx='gitx --all';
alias gg="${ROOT_PATH}/quick-commit.sh";
alias ggg='gaa && gcm "wip" && gp';

## git reset:
alias git-reset="${ROOT_PATH}/reset-git.sh";

## add github cache:
alias github-cache='ssh-add ~/.ssh/id_rsa.github.com >/dev/null 2>/dev/null;';
