#!/bin/bash

DOTFILESDIRECTORY=$(pwd)
ZSH_PACKAGES_DB="$DOTFILESDIRECTORY/db/zsh_packages.md"

echo "Installing Vim-Plug"

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo ""

mkdir -p ~/.zsh/plugin

mkdir ~/.config

echo "Creating a symbolic link to the home directory for .vimrc and .zshrc"

## Remove any old .vimrc and .zshrc files
rm ~/.zshrc
rm -rf ~/.config/nvim

## Create them again but this time linked to this dotfiles
ln -s "$DOTFILESDIRECTORY/zsh/.zshrc" ~/.zshrc 
ln -s "$DOTFILESDIRECTORY/git/.gitignore_global" ~/.gitignore_global
ln -s "$DOTFILESDIRECTORY/git/.gitconfig" ~/.gitconfig
ln -s "$DOTFILESDIRECTORY/nvim" ~/.config/nvim
ln -s "$DOTFILESDIRECTORY/nvim/init.vim" ~/.config/nvim/init.vim
ln -s "$DOTFILESDIRECTORY/.ackrc" ~/.ackrc

installPackages() {
	while IFS="=" read -r packageName packageGitURL 
	do
		echo "Installing $packageName"
		
		git clone "$packageGitURL" "$2/$packageName"
	done < $1
}

echo "Installing ZSH Packages"
echo ""

installPackages $ZSH_PACKAGES_DB ~/.zsh

echo ""

exit 0
