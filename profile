# _____            
#| ____|_ ____   __
#|  _| | '_ \ \ / /
#| |___| | | \ V / 
#|_____|_| |_|\_/  
#                  
# Author: github@66RING

#========================
# Global
#========================
export PATH="$PATH:$HOME/.local/bin:/home/ring/.local/bin"
export SUDO_ASKPASS="/$HOME/scripts/global/rofipass.sh"
export MAIN_HOME="/home/ring"
export PATH="$PATH:./node_modules/.bin"



#************************
#* python
#************************
export WORKON_HOME=~/.virtualenvs


#************************
#* Golang
#************************
export GOROOT=/usr/lib/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Documents/code/go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on
export GOPROXY=https://goproxy.io


#************************
#* default env
#************************
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="google-chrome-stable"
export VIDEO="mpv"
export IMAGE="sxiv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export WM="bspwm"
export LAUNCHER="rofi"

