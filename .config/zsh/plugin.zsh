# _____        __       ____  __            _     
#/__  /  _____/ /_     / __ \/ /_  ______ _(_)___ 
#  / /  / ___/ __ \   / /_/ / / / / / __ `/ / __ \
# / /__(__  ) / / /  / ____/ / /_/ / /_/ / / / / /
#/____/____/_/ /_/  /_/   /_/\__,_/\__, /_/_/ /_/ 
#                                 /____/          
#
# Author: github@66RING

#************************
#* plugin
#************************
# Basic auto/tab complete:
autoload -U compinit
autoload -U colors && colors
compinit
# control with arrow key
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# history
HISTSIZE=20000
SAVEHIST=20000
HISTFILE=~/.cache/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS     # ignore duplicating history
setopt hist_ignore_space    # do not save history when command begin with space

source $HOME/.config/zsh/plugins/vi-mode/vi-mode.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# fzf
source $HOME/.config/zsh/fzf.zsh
source $HOME/.config/zsh/plugins/fzf-tab/fzf-tab.zsh
source $HOME/.config/zsh/plugins/zsh-autopair/autopair.zsh
# autopair-init


#************************
#* theme
#************************
source $HOME/.config/zsh/themes/mytheme.zsh-theme
# theme-depandency
setopt prompt_subst
source $HOME/.config/zsh/lib/git.zsh


#************************
#* colorful man page
#************************
export LESS_TERMCAP_mb=$'\e[6m'          # begin blinking
export LESS_TERMCAP_md=$'\e[34m'         # begin bold
export LESS_TERMCAP_us=$'\e[4;32m'       # begin underline
export LESS_TERMCAP_so=$'\e[1;33;41m'    # begin standout-mode - info box
export LESS_TERMCAP_me=$'\e[m'           # end mode
export LESS_TERMCAP_ue=$'\e[m'           # end underline
export LESS_TERMCAP_se=$'\e[m'           # end standout-mode

