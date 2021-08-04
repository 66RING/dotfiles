#!/bin/sh

path=$(pwd)

ln -s $path/.config $HOME/.config
ln -s $path/nvim $HOME/.config/nvim
ln -s $path/nvim/init.vim $HOME/.vimrc

# zsh
ln -s $path/.config/zsh/.zprofile $HOME/.zprofile

# bins + applications
ln -s $path/.local/bin/* $HOME/.local/bin/
ln -s $path/.local/share/applications/* $HOME/.local/share/applications/

