#/usr/bin/env bash

CODE="${HOME}/Code"
DOTFILES="${CODE}/dotfiles"

function require_commands () {
    NEEDED_COMMANDS=$1
    local missing_counter=0
    for needed_command in $NEEDED_COMMANDS; do
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
}

function stow_install () {
	stow --target=$HOME --dir=${DOTFILES}/stow-directory home

	echo "Uninstall with following command:"
	echo stow -D '--target=$HOME' --dir=$CODE/dotfiles/stow-directory home
}

function stow_uninstall () {
	stow -D --target=$HOME --dir=$CODE/dotfiles/stow-directory home
}

function install_neovim_plugin_manager () {
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


function install_linux_deps () {
    sudo apt-get update
    sudo apt-get install git build-essential openssh-server vim tmux
}

function configure_git () {
    git config --global user.email "ian.p.mclaughlin@gmail.com"
    git config --global user.name "Ian McLaughlin"
}

# wget https://raw.githubusercontent.com/boombador/dotfiles/master/setup.sh

require_commands "git vim tmux stow nvim"
git clone https://github.com/boombador/dotfiles.git $DOTFILES
stow_install
install_neovim_plugin_manager
nvim +PluginInstall +qall
