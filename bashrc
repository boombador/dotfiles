#!/usr/bin/env bash

function detectPlatform {
    local platform="unknown"
    local unamestr=$(uname)
    if [[ "$unamestr" == 'Linux' ]]; then
        platform="linux"
    elif [[ "$unamestr" == 'Darwin' ]]; then
        platform="macosx"
    else
        echo "Unknown platform: $platform"
    fi
    export DETECTED_PLATFORM=$platform
}

detectPlatform

export CODE="$HOME/Code"
export MYDOTFILES="$CODE/dotfiles"
export REPOS_DIR="$HOME/Code"
export PATH="$HOME/bin:$PATH"
export WORKBASHRC="$HOME/work_config.sh"

export MYVIMRC="$HOME/.vimrc"
export MYTMUXCONF="$HOME/.tmux.conf"
export MYBASHRC="$HOME/.bash_profile"  # for non-mac: .bashrc?
export MYORGMODE="$HOME/GTD.org"
export NOTES="$HOME/Notes"
export MYNOTESSCRATCH="$NOTES/scratch.md"

# export PS1='[\u@\h \W]\$ '

. $MYDOTFILES/bash/helpers.sh
. $MYDOTFILES/bash/docker.sh
. $MYDOTFILES/bash/editor.sh
. $MYDOTFILES/bash/golang.sh
. $MYDOTFILES/bash/git.sh
. $MYDOTFILES/bash/java.sh
. $MYDOTFILES/bash/node.sh
. $MYDOTFILES/bash/python.sh
. $MYDOTFILES/bash/tmux.sh

alias ll='ls -lha'

if [ -f $WORKBASHRC ]; then
  . $WORKBASHRC
fi

function goodmorning () {
    initProjectSession admin $NOTES
    initProjectSession dots $MYDOTFILES

    REQUESTED_TMUX_SESSION="$(workInit)"
    if [ -z $REQUESTED_TMUX_SESSION ]; then
        attachAfterCreate admin
    else
        attachAfterCreate $REQUESTED_TMUX_SESSION
    fi
}

function goodnight () {
    tmux_shutdown
}
