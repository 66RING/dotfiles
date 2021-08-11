#!/bin/sh

STOW_DIR=$(pwd)/..
TAR_DIR=${HOME}

stow -t "$TAR_DIR" -d "$STOW_DIR" --ignore='.*\.md' --ignore='.*\.sh' --ignore='\.git.*' dotfiles

# remove
# stow -t "$TAR_DIR" -d "$STOW_DIR" -D dotfiles



