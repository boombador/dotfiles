#!/usr/bin/env bash

# this is for shell agnostic code and so far that means bash and zsh,
# though support for zsh is almost completely untested

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
export PATH="$HOME/bin:$PATH"
export WORKBASHRC="$HOME/work_config.sh"
export MYTMUXCONF="$HOME/.tmux.conf"

# update these
export MYORGMODE="$HOME/GTD.org"
export NOTES="$HOME/workspace"
export MYNOTESSCRATCH="$NOTES/scratch.md"
export MYVIMRC="$MYDOTFILES/config/nvim/init.vim"
export MYBASHRC="$HOME/.bash_profile"  # for non-mac: .bashrc?

# export PS1='[\u@\h \W]\$ '

# should be in the same directory
. $HOME/.config/bash/helpers.sh
. $HOME/.config/bash/docker.sh
. $HOME/.config/bash/editor.sh
. $HOME/.config/bash/golang.sh
. $HOME/.config/bash/git.sh
. $HOME/.config/bash/java.sh
. $HOME/.config/bash/node.sh
. $HOME/.config/bash/python.sh
. $HOME/.config/bash/tmux.sh

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

# rust tool
export PATH="$HOME/.cargo/bin:$PATH"

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# python : pyenv (rbenv or nvm-like tool)
export PATH="/home/ian/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# python : poetry (cargo-like tool)
export PATH="$HOME/.poetry/bin:$PATH"
