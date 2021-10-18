#    ___    ___                     
#   /   |  / (_)___ _________  _____
#  / /| | / / / __ `/ ___/ _ \/ ___/
# / ___ |/ / / /_/ (__  )  __(__  ) 
#/_/  |_/_/_/\__,_/____/\___/____/  
#                                   
# Author: github@66RING

alias c='clear'
alias cp='cp -iv'
alias grep='grep --color'
alias egrep='egrep --color'
alias g='git'
alias gct='git clone --depth=1'
alias ggl='git log --graph --pretty=oneline --abbrev-commit'
alias ls='ls --color'
alias ll='ls -l'
# alias m='neomutt'
alias md='mkdir'
alias mf='touch'
# alias qrcp='qrcp -k'
alias rm='rm -I'
alias sctl='systemctl'
alias bctl='bluetoothctl'
#
# APPs
alias yg='you-get'
alias top='htop'
alias vim='nvim'
# alias vi='nvim'
alias s='neofetch | lolcat'
alias ra='ranger'
alias lg='lazygit'
alias tl='proxyon && tldr'
alias ct='cht.sh'
alias py='python'
#
# TOOls
alias pc='proxyon && '


#************************
#* tools
#************************
alias venvon="source $(which virtualenvwrapper.sh)"
proxy_servce='http://127.0.0.1:7890'
alias proxyon='export http_proxy="$proxy_servce" export https_proxy="$proxy_servce" export use_proxy=yes'
alias proxyoff='unset http_proxy  unset https_proxy use_proxy'

alias poweroff="prompt2 'Shutdown?' 'poweroff'"
alias reboot="prompt2 'Reboot?' 'reboot'"

# scripts/utils
SCRIPTS_DIR='~/.local/bin/scripts'
alias t="http_proxy= https_proxy= $SCRIPTS_DIR/utils/ai_trans_demo.py"
alias osdoc="$SCRIPTS_DIR/utils/osdoc.sh"
# alias bc="$SCRIPTS_DIR/utils/calc"
