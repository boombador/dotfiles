
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='macosx'
fi

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

alias tmux='tmux -2'
alias gs='git status'
alias gd='git diff --ignore-space-change | vim -'
alias gds='git diff | vim -'
alias gsd='git diff --staged | vim -'
alias ll='ls -la'
alias v='nvim'
alias vim='nvim'

export EDITOR=nvim
export GOPATH=$HOME/src/gocode
export PATH=$PATH:/usr/local/go/bin:$HOME/bin

if [[ $platform == 'linux' ]]; then
  alias ack='ack-grep'
  alias e='emacs25'
elif [[ $platform == 'macosx' ]]; then
  export PATH="/Users/ian/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"

  alias isdockerflush='cat ~/Library/Containers/com.docker.docker/Data/database/com.docker.driver.amd64-linux/disk/full-sync-on-flush'
  alias e="/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -nw" # no graphical window, terminal only
  alias emacs="/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs"

  # Setting PATH for Python 3.4
  # The orginal version is saved in .bash_profile.pysave
  PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
  export PATH
fi

#source '/home/ian/google-cloud-sdk/path.bash.inc'
#source '/home/ian/google-cloud-sdk/completion.bash.inc'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export MYVIMRC="$HOME/.vimrc"
export MYTMUXCONF="$HOME/.tmux.conf"
export MYBASHRC="$HOME/.bash_profile"  # for non-mac: .bashrc?
export MYORGMODE="$HOME/GTD.org"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# git config --global core.excludesfile ~/.gitignore_global
# git config --global user.name
# git config --global user.email

export PATH=/Users/ian/Desktop/tower/scripts:$PATH

export TOWER_DEV_DIR="/Users/ian/Desktop/tower"

export PATH=/Users/ian/Desktop/tower/scripts:$PATH

export TOWER_DEV_DIR="/Users/ian/Desktop/tower"
