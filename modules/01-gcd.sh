#!/usr/bin/env bash
# ============================================================================
# gcd (Git Clone & cd) - 智能克隆并进入 Git 仓库
# ============================================================================
#
# 功能说明：
#   根据仓库 URL 自动判断来源，克隆到对应的本地目录结构中，并切换到该目录。
#   如果目录已存在，则直接进入并执行 git pull。
#
# 目录规则：
#   GitHub 仓库：
#     - afeiship 组织（个人默认）：~/github/<仓库名>
#     - 其它组织：~/github/<组织名>/<仓库名>
#     - 无组织：~/github/<仓库名>
#
#   非 GitHub 仓库：
#     - 有组织：~/git-repos/<域名>/<组织名>/<仓库名>
#     - 无组织：~/git-repos/<域名>/<仓库名>
#
# 使用示例：
#   gcd git@github.com:afeiship/ushell-module-git.git
#     → ~/github/ushell-module-git
#
#   gcd git@github.com:anthropics/claude-code.git
#     → ~/github/anthropics/claude-code
#
#   gcd https://github.com/cli/cli.git
#     → ~/github/cli/cli
#
#   gcd git@git.saybot.net:team/project.git
#     → ~/git-repos/git.saybot.net/team/project
#
#   gcd git@gitlab.com:user/repo.git
#     → ~/git-repos/gitlab.com/user/repo
#
# 支持的 URL 格式：
#   - SSH:   git@domain:org/repo.git 或 git@domain:repo.git
#   - HTTPS: https://domain/org/repo.git
# ============================================================================

GIT_URL=$1;
dir=`basename $GIT_URL .git`;

# Parse URL to extract domain and org/repo path
if [[ $GIT_URL == git@* ]]; then
    # SSH format: git@domain:org/repo.git or git@domain:repo.git
    domain=$(echo $GIT_URL | sed 's|git@\([^:]*\):.*|\1|')
    path_part=$(echo $GIT_URL | sed 's|git@[^:]*:\(.*\)|\1|')
else
    # HTTPS format: https://domain/org/repo.git
    domain=$(echo $GIT_URL | awk -F/ '{print$3}')
    path_part=$(echo $GIT_URL | sed 's|https\?://[^/]*/\(.*\)|\1|')
fi

# Extract org name (if exists)
orgname=$(echo $path_part | awk -F/ '{print$1}')
if [[ "$orgname" == "$dir" ]]; then
    # No org, just repo name
    orgname=""
fi

# Determine local directory based on domain and org
if [[ $domain == 'github.com' ]]; then
    # GitHub repos: all go to ~/github/
    # afeiship is personal default org, skip org subdir
    if [[ -n $orgname && $orgname != "afeiship" ]]; then
        localdir="$HOME/github/$orgname/$dir";
    else
        localdir="$HOME/github/$dir";
    fi
else
    # Non-GitHub repos: go to ~/git-repos/domain[/org]/repo
    if [[ -n $orgname ]]; then
        localdir="$HOME/git-repos/$domain/$orgname/$dir";
    else
        localdir="$HOME/git-repos/$domain/$dir";
    fi
fi

# test local dir,  if exists, cd to it and pull, else mkdir and clone
if [ -d $localdir ]; then
    cd $localdir && git pull;
else
    subdir=`dirname $localdir`;
    mkdir -p $subdir && cd $subdir;
    git clone $GIT_URL && cd $dir;
fi