#!/usr/bin/env bash

emacs_command=""
if [[ $DETECTED_PLATFORM == 'linux' ]]; then
    emacs_command="emacs"
elif [[ $DETECTED_PLATFORM == 'macosx' ]]; then
    emacs_command="/Applications/Emacs.app/Contents/MacOS/Emacs"
fi

vim_command="nvim"

alias e="$emacs_command -nw"
alias v="$vim_command"
alias vi="$vim_command"
alias vim="$vim_command"

export EDITOR="$vim_command"
