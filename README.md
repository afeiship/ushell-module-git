# ushell-module-git
> Unix like shell module for git.

## resources:

## encoding utf-8
+ http://www.worldhello.net/gotgit/08-git-misc/020-git-charset.html

## commands:


## install private package:
> Git仓库当私有npm
> 这个方法得益于，npm提供的的丰富安装方法。通过下面方法安装：

```bash
npm i -S git+ssh://git@git.showgold.cn:npm/hello.git
npm install -S git+ssh://git@github.com:npm/npm.git#v1.0.27
npm install -S git+ssh://git@github.com:npm/npm#semver:^5.0
npm install -S git+https://isaacs@github.com/npm/npm.git
npm install -S git://github.com/npm/npm.git#v1.0.27
```