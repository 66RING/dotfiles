#!/bin/sh

STOW_DIR=$(pwd)/..
TAR_DIR=${HOME}

mkdir -p "$TAR_DIR/.config" \
	  "$TAR_DIR/.local/bin" \
	  "$TAR_DIR/.local/share/applications"

stow -t "$TAR_DIR" -d "$STOW_DIR" --ignore='.*\.md' --ignore='.*\.sh' --ignore='\.git.*' dotfiles

# remove
# stow -t "$TAR_DIR" -d "$STOW_DIR" -D dotfiles



