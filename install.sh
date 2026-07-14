#!/usr/bin/env sh
set -eu

DOTFILES_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

link_file() {
  source=$1
  target=$2

  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    printf 'ok: %s -> %s\n' "$target" "$source"
    return 0
  fi

  if [ -e "$target" ] || [ -L "$target" ]; then
    printf 'error: %s already exists; remove it first if you want this dotfile linked\n' "$target" >&2
    return 1
  fi

  ln -s "$source" "$target"
  printf 'linked: %s -> %s\n' "$target" "$source"
}

mkdir -p "$HOME/.config"

##link_file "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"
link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
