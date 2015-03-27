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
    printf "Minimum %d commands are missing in PATH, aborting\n" "$missing_counter" >&2
    exit 1
fi

git clone https://github.com/boombador/dotfiles.git ~/dev/dotfiles
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install files (maybe symlink is better?)
# TODO: give notice for pre-existing files
cp --interactive ~/dev/dotfiles/bashrc ~/.bashrc
cp --interactive ~/dev/dotfiles/vimrc ~/.vimrc
cp --interactive ~/dev/dotfiles/tmux.conf ~/.tmux.conf

vim +PluginInstall +qall
