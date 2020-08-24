#!/usr/bin/env bash
## path:
ROOT_PATH=$(dirname $BASH_SOURCE);

source $ROOT_PATH/git-flow.sh;

## git base:
alias gl='git pull';
alias glb='git pull --rebase';
alias gp='git push';
alias glo='git pull origin ';
alias gpo='git push origin ';

# push branchs/tags/deletes
alias gpa='git push --all -u';
alias gpt="git push origin --tags";
alias gpd="git push origin --delete ";

alias gam='git add -A';
alias gcm='git commit -m ';
alias gam='git commit -am ';
alias goo='git checkout origin ';
alias gc='git clone';
alias gc1='git clone --depth=1';

# git fetch:
alias gft='git fetch';
alias gfa='git fetch --all';
alias gfp='git fetch --all --prune';


## git revert:
alias gr='git checkout -f';
alias gck='git checkout ';
alias gcy='git cherry-pick';

# merge:
alias gm='git merge ';
alias gmm='git merge master';
alias gmd='git merge develop';
alias gmdev='git merge dev';

## chekcout
alias gckm='git checkout master';
alias gckd='git checkout develop';
alias gckr='git checkout release';
alias gckdev='git checkout dev';

## git others:
alias gs='git status ';
alias ga='git add ';
alias gb='git branch ';
alias gd='git diff';
alias gk='gitk --all&';
alias gx='gitx --all';
alias gg="${ROOT_PATH}/quick-commit.sh";
alias ggg='gam "wip" && gp';

## git tags:
alias ggt="${ROOT_PATH}/quick-tag.sh";


## git reset:
alias git-reset="${ROOT_PATH}/reset-git.sh";

## add github cache:
alias github-cache='ssh-add ~/.ssh/id_rsa.github.com >/dev/null 2>/dev/null;';

# git-url-cli
# alias guc='git-url-cli'

# Install
## curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

# git-completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi