#!/usr/bin/env bash

alias gsha='git rev-parse HEAD | cut -c1-8'
alias gs='git status'
alias gd='git diff --ignore-space-change | vim -'
alias gds='git diff | vim -'
alias gsd='git diff --staged | vim -'
alias co='git checkout'
# git config --global core.excludesfile ~/.gitignore_global
# git config --global user.name
# git config --global user.email

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
