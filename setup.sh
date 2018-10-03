my_needed_commands="git vim tmux"

missing_counter=0
for needed_command in $my_needed_commands; do
    if ! hash "$needed_command" >/dev/null 2>&1; then
        printf "Command not found in PATH: %s\n" "$needed_command" >&2
        ((missing_counter++))
        # TODO detect package manager and ask whether to install packages
    fi
done

if ((missing_counter > 0)); then
    printf "%d required commands are missing in PATH, aborting\n" "$missing_counter" >&2
    exit 1
fi

git clone https://github.com/boombador/dotfiles.git ~/dev/dotfiles
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

function backup () {
    src="$1"
    dest="${src}.bak"
    if [ -e $dest ]; then
        echo "Backup file $dest already exists, skipping..."
        # create new temp file?
        return 1
    fi

    if [ -e $src ]; then
        cp --interactive $src $dest
    fi
}

function link () {
    dotfiles="$1"
    filename="$2"
    src="$dotfiles/$filename"
    dest=".$filename"
    
    # error checking?
    ln -s $src $dest
}

ln -s $HOME/Code/dotfiles/bashrc .bashrc

DOTFILES="$HOME/Code/dotfiles"

backup $HOME/.bashrc
backup $HOME/.vimrc
backup $HOME/.tmux.conf

link $DOTFILES "bashrc"
link $DOTFILES "vimrc"
link $DOTFILES "tmux.conf"

vim +PluginInstall +qall
