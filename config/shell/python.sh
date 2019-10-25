#!/usr/bin/env bash

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/virtualenvwrapper-stuff

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# source $HOME/.pyenv/shims/virtualenvwrapper.sh


# pyenv virtualenv 3.7.3 my-virtual-env-3.7.3
alias pyenv-create='pyenv virtualenv 3.7.3'
alias pyenv-delete='pyenv uninstall'
