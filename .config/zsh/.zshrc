# _______| |__  _ __ ___ 
#|_  / __| '_ \| '__/ __|
# / /\__ \ | | | | | (__ 
#/___|___/_| |_|_|  \___|
#
# Author: github@66RING
# /home/ring/.config/zsh/.zprofile
source ~/.config/zsh/lf_setting.zsh
source ~/.config/zsh/plugin.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/utils.zsh

if [ -e ~/.local_settings.zsh ]; then
	source ~/.local_settings.zsh
fi
