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
export PATH="$PATH:$HOME/.local/bin"
export SUDO_ASKPASS="/$HOME/scripts/global/rofipass"
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

#************************
#* env
#************************
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export ERRFILE="$XDG_CACHE_HOME/x11/xsession-errors"


export LESSHISTFILE="-"

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"


export MYSQL_HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/mysql_history"
export NUGET_PACKAGES="${XDG_CACHE_HOME:-$HOME/.cache}/NuGetPackages"
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/docker"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export WINEARCH=win32
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export PYLINTHOME="$XDG_CACHE_HOME"/pylint

#
# Virsh
#
export VIRSH_DEFAULT_CONNECT_URI='qemu:///system'

#
# Other
#
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export QT_QPA_PLATFORMTHEME="gtk3"	# Have QT use gtk3 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.

# Scaling
export GDK_SCALE=1.5
export GDK_DPI_SCALE=1.5
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=1.5

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"




#
# Start X
#

[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"

