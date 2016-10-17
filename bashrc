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

# PS1='[\u@\h \W]\$ '

# shopt -s cdspell
# shopt -s checkwinsize
# shopt -s cmdhist
# shopt -s dotglob
# shopt -s expand_aliases
# shopt -s extglob
# shopt -s histappend
# shopt -s hostcomplete
# shopt -s nocaseglob

#alias tmux='tmux -2'
alias gs='git status'
alias gd='git diff --ignore-space-change | vim -'
alias gds='git diff | vim -'
alias gsd='git diff --staged | vim -'
alias ll='ls -la'

export EDITOR=vim
#export GOPATH=$HOME/gocode

#export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre"

#export NVM_DIR="/home/ian/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#source '/home/ian/google-cloud-sdk/path.bash.inc'
#source '/home/ian/google-cloud-sdk/completion.bash.inc'

# if $(determine if apple); then
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# else
# this breaks mac, but is needed on linux
# FIXME: need this back for linux
#alias ack='ack-grep'
#fi

export VENUE_PORTAL_BACKEND='http://localhost:8001/api'
