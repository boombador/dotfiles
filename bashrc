#!/usr/bin/env bash

export MYDOTFILES="$HOME/Code/dotfiles"
export CODE="$HOME/Code"
export REPOS_DIR="$HOME/Code"
export PATH="$HOME/bin:$PATH"

export MYVIMRC="$HOME/.vimrc"
export MYTMUXCONF="$HOME/.tmux.conf"
export MYBASHRC="$HOME/.bash_profile"  # for non-mac: .bashrc?
export MYORGMODE="$HOME/GTD.org"
export MYNOTESSCRATCH="$HOME/Notes/scratch.md"

# export PS1='[\u@\h \W]\$ '

. $MYDOTFILES/bash/helpers.sh
. $MYDOTFILES/bash/java.sh
. $MYDOTFILES/bash/golang.sh
. $MYDOTFILES/bash/node.sh
. $MYDOTFILES/bash/docker.sh
. $MYDOTFILES/bash/editor.sh

alias tmux='tmux -2'
alias ll='ls -lha'
#alias ack='ack-grep'

if [ -f ~/work_config.sh ]; then
  . ~/work_config.sh
fi
