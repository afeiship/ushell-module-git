#!/usr/bin/env bash
## path:
ROOT_PATH=$(dirname $BASH_SOURCE);

source $ROOT_PATH/modules/02-git-flow.sh;
source $ROOT_PATH/modules/07-git-rebase.sh;

## git base:
alias gl='git pull';
alias gp='git push';
alias glo='git pull origin ';
alias gpo='git push origin ';

# push branchs/tags/deletes
alias gpa='git push --all -u';
alias gpt="git push origin --tags";
alias gpd="git push origin --delete ";

alias gaa='git add .';
alias gcm='git commit -m ';
alias gam='git commit -am ';
alias goo='git checkout origin ';
alias gc='git clone';
alias gc1='git clone --depth=1';

# clean untrack files
# https://stackoverflow.com/questions/61212/how-to-remove-local-untracked-files-from-the-current-git-working-tree
alias gcf='git clean -f';

# git fetch:
alias gft='git fetch';
alias gfa='git fetch --all';
alias gfp='git fetch --all --prune';


## git revert:
alias gr='git checkout -f';
alias gck='git checkout ';
alias g-='git checkout -';
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
alias gbh='git branch -h';
alias gd='git diff';
alias gk='gitk --all&';
alias gx='gitx --all';
alias gg="${ROOT_PATH}/modules/05-quick-commit.sh";
alias ggg='gaa && gcm "wip" && gp';

## git tags:
alias gcd=". ${ROOT_PATH}/modules/01-gcd.sh";
alias ggt="${ROOT_PATH}/modules/03-quick-tag.sh";
alias git-reset="${ROOT_PATH}/modules/04-reset-git.sh";
alias git-clean="${ROOT_PATH}/modules/06-git-clean.sh";


# check git repo size
alias git-size="git count-objects -vH";

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