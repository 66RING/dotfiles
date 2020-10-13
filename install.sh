#!/bin/sh

path=$(pwd)

ln -s $path/.config $HOME/.config
ln -s $path/nvim $HOME/.config/nvim
ln -s $path/nvim/init.vim $HOME/.vimrc

# xorg
ln -s $path/.config/xorg/.xinitrc $HOME/.xinitrc
ln -s $path/.config/xorg/.Xmodmap $HOME/.Xmodmap
ln -s $path/.config/xorg/.xprofile $HOME/.xprofile

# zsh
ln -s $path/.config/zsh/.zshrc $HOME/.zshrc

# tmux
ln -s $path/.config/tmux/.tmux.conf $HOME/.tmux.conf

# ideavim
ln -s $path/nvim/.ideavimrc $HOME/.ideavimrc

