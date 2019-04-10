#!/usr/bin/env bash

alias dkill='docker kill $(docker ps -a -q)'
alias drmcontainers='docker kill $(docker ps -a -q); docker rm $(docker ps -a -q)'
alias dclean='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker rmi $(docker images -q)'
alias dclean_some='docker rmi $(docker images -a | grep -v openjdk | awk "{if (NR>1) print $3}")' # will this work? quote escaping seemed sketchy 
alias dhash='CURRENT_HASH=$(git rev-parse HEAD | cut -c1-8)'
alias dproject='PROJECT="missing-\PROJECT-variable"'
alias dbuild='docker build --tag "${PROJECT}:${CURRENT_HASH}" .'
alias drun='docker run $PORTS --name "$PROJECT" -t $PROJECT:$CURRENT_HASH'
alias dbash='docker run $PORTS --name "$PROJECT" -it $PROJECT:$CURRENT_HASH bash'
