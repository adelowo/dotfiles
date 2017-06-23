#!/bin/bash

DOTFILESDIRECTORY=$(pwd)

echo "Creating a symbolic link to the home directory for .vimrc and .zshrc"

echo ""

## Remove any old .vimrc and .zshrc files
rm ~/.vimrc
rm ~/.zshrc

## Create them again but this time linked to this dotfiles
ln -s "$DOTFILESDIRECTORY/.vimrc" ~/.vimrc
ln -s "$DOTFILESDIRECTORY/.zshrc" ~/.zshrc 

exit 0
