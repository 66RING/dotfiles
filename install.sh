#!/bin/sh

# STOW_DIR=$(pwd)/..
# TAR_DIR=${HOME}

# mkdir -p \
# 	  "$TAR_DIR/.local/bin" \
# 	  "$TAR_DIR/.local/share/applications"

# stow -t "$TAR_DIR" -d "$STOW_DIR" --ignore='.*\.md' --ignore='.*\.sh' --ignore='\.git.*' dotfiles

# remove
# stow -t "$TAR_DIR" -d "$STOW_DIR" -D dotfiles


git submodule update --init --recursive

mkdir -p \
	  "$HOME/.local/bin" \
	  "$HOME/.local/share/applications"

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

ln -s $BASEDIR/.config $HOME
ln -s $BASEDIR/.local/bin/* $HOME/.local/bin/
ln -s $BASEDIR/.local/share/applications/* $HOME/.local/share/applications/

ln -s $BASEDIR/.config/zsh/.zprofile $HOME/
ln -s $BASEDIR/.config/tmux/.tmux.conf $HOME/


# pacman -S --needed - < pkglist.txt
