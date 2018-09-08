#!/usr/bin/env bash

export EDITOR="nvim"

if [[ $DETECTED_PLATFORM == 'linux' ]]; then
    alias e='emacs25'
elif [[ $DETECTED_PLATFORM == 'macosx' ]]; then
    alias e="/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -nw" # no graphical window, terminal only
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
    #alias emacs="/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs"
fi
alias v='nvim'
alias vim='nvim'
