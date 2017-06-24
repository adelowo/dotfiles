#!/bin/bash

DOTFILESDIRECTORY=$(pwd)
ZSH_PACKAGES_DB="$DOTFILESDIRECTORY/db/zsh_packages.md"
VIM_PACKAGES_DB="$DOTFILESDIRECTORY/db/vim_packages.md"

mkdir -p ~/.vim/autoload ~/.vim/bundle 
mkdir -p ~/.zsh/plugin

##Only install pathogen if it doesn't exist already

if [[ ! -f ~/.vim/autoload/pathogen.vim ]]; then 
        echo "Installing the Pathogen plugin manager for vim"
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

echo "Creating a symbolic link to the home directory for .vimrc and .zshrc"

## Remove any old .vimrc and .zshrc files
rm ~/.vimrc
rm ~/.zshrc

## Create them again but this time linked to this dotfiles
ln -s "$DOTFILESDIRECTORY/vim/.vimrc" ~/.vimrc
ln -s "$DOTFILESDIRECTORY/zsh/.zshrc" ~/.zshrc 
ln -s "$DOTFILESDIRECTORY/git/.gitignore_global" ~/.gitignore_global
ln -s "$DOTFILESDIRECTORY/git/.gitconfig" ~/.gitconfig


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


echo "Installing vim plugins"
echo ""

installPackages $VIM_PACKAGES_DB ~/.vim/bundle

echo ""

exit 0
