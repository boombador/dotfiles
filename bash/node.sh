#!/usr/bin/env bash

export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi
if [ -s "$NVM_DIR/bash_completion" ]; then
    \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi
