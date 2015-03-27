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

PS1='[\u@\h \W]\$ '

# shopt -s cdspell
# shopt -s checkwinsize
# shopt -s cmdhist
# shopt -s dotglob
# shopt -s expand_aliases
# shopt -s extglob
# shopt -s histappend
# shopt -s hostcomplete
# shopt -s nocaseglob

alias tmux='tmux -2'
alias gs='git status'
alias gds='git diff --ignore-space-change'
alias gd='git diff'
alias gsd='git diff --staged'

# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin

export EDITOR=vim
