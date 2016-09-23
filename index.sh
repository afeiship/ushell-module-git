#!/usr/bin/env bash
## path:
ROOT_PATH=$(pwd);

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
alias gr='git checkout -f'

## git others:
alias gs='git status ';
alias ga='git add ';
alias gb='git branch ';
alias gd='git diff';
alias go='git checkout ';
alias gk='gitk --all&';
alias gx='gitx --all';
alias gg="${ROOT_PATH}/quick-commit.sh";
alias ggg='gaa && gcm "wip" && gp';
