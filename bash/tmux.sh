#!/usr/bin/env bash

# very helpful:
# https://stackoverflow.com/questions/3432536/how-to-create-new-tmux-session-if-none-exists/3432749
# https://coderwall.com/p/tgm2la/auto-attach-or-start-tmux-at-login

alias tmux='tmux -2'

function initProjectSession () {
    if [ ! -z "$TMUX" ]; then
        return 0
    fi

    local PROJECT_NAME="$1"
    local PROJECT_DIR="$2"
    local CONFIG_OVERRIDE="$3"  # if not empty, use instead of searching in dotfiles

    local TMUX_CONFIG="${DOTFILES}/tmux/${PROJECT_NAME}.conf"
    if [ ! -z $CONFIG_OVERRIDE ]; then
        TMUX_CONFIG=$CONFIG_OVERRIDE
    fi

    tmux has-session -t $PROJECT_NAME 2>/dev/null
    if [ "$?" -eq 1 ] ; then
        echo "No Session found.  Creating..."
        pushd $PROJECT_DIR
        tmux new-session -d -s $PROJECT_NAME
        if [ -f $TMUX_CONFIG ]; then
            echo "Configuring with $TMUX_CONFIG..."
            tmux source-file $TMUX_CONFIG
        fi
        popd
    else
        echo "Session $PROJECT_NAME found"
    fi
}

function attachAfterCreate () {
    if [ ! -z "$TMUX" ]; then
        return 0
    fi

    PROJECT_NAME="$1"
    if tmux has-session -t $PROJECT_NAME 2>/dev/null; then
        echo "about to attach"
        tmux attach-session -t $PROJECT_NAME
    else
        echo "about to create"
        tmux new-session -A -s $PROJECT_NAME
    fi
}
