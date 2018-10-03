#!/usr/bin/env bash

# ex - archive extractor
# usage: ex <file>
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function sourceIfFile () {
    file_path="$1"
    echo $file_path

    if [ -f $file_path ]; then
        . $file_path
    fi
}

function initProjectSession () {
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
            echo "and configuring with $TMUX_CONFIG..."
            tmux source-file $TMUX_CONFIG
        fi
        popd
    else
        echo "Session $PROJECT_NAME found"
    fi
}

function attachAfterCreate () {
    PROJECT_NAME="$1"
    if [ -z "$TMUX" ]; then
        if tmux has-session -t $PROJECT_NAME 2>/dev/null; then
            echo "about to attach"
            tmux -2 attach-session -t $PROJECT_NAME
        else
            echo "about to create"
            tmux -2 new-session -A -s $PROJECT_NAME
        fi
    fi
}
