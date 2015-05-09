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

# backup existing files and replace with symlinks to the repo
if [ -e ~/.bashrc ]; then cp --interactive ~/.bashrc ~/bashrc.bak; fi
if [ -e ~/.vimrc ]; then cp --interactive ~/.vimrc ~/vimrc.bak; fi
if [ -e ~/.tmux.conf ]; then cp --interactive ~/.tmux.conf ~/tmux.conf.bak; fi
ln -s ~/dev/dotfiles/bashrc .bashrc
ln -s ~/dev/dotfiles/vimrc .vimrc
ln -s ~/dev/dotfiles/tmux.conf .tmux.conf

vim +PluginInstall +qall
