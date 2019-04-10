#!/usr/bin/env bash

# xmodmap ~/.xmodmap

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
export NOTES="$HOME/workspace"
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

STARTING_TMUX_SESSION=admin
if [ -f $WORKBASHRC ]; then
    . $WORKBASHRC
    WORK_TMUX_DEFAULT_SESSION="$(workInit)"
    
    if [ ! -z "${WORK_TMUX_DEFAULT_SESSION}" ]; then
        STARTING_TMUX_SESSION="$WORK_TMUX_DEFAULT_SESSION"
    fi
fi

function goodmorning () {
    #initProjectSession admin $NOTES
    #initProjectSession dots $MYDOTFILES
    attachAfterCreate $STARTING_TMUX_SESSION
}

function goodnight () {
    tmux_shutdown
}

export PATH="$HOME/.cargo/bin:$PATH"
