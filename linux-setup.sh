#/usr/bin/env bash

function install_vim_plugin_manager () {
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_config_files () {
	stow -t $HOME home
	stow -t $HOME/.config config
}

install_config_files
install_vim_plugin_manager
