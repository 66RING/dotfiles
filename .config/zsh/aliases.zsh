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
alias lg='lazygit'
# alias m='neomutt'
alias md='mkdir'
alias mf='touch'
alias pc='proxyon && '
# alias qrcp='qrcp -k'
alias ra='ranger'
alias rm='rm -I'
alias sctl='systemctl'
alias bctl='bluetoothctl'
alias s='neofetch | lolcat'
alias top='htop'
alias vim='nvim'
# alias vi='nvim'
alias yg='you-get'


#************************
#* tools
#************************
alias venvon="source $(which virtualenvwrapper.sh)"
alias proxyon='export all_proxy="http://127.0.0.1:7890" export all_proxy="http://127.0.0.1:7890" use_proxy=yes'
alias proxyoff='unset all_proxy  unset export all_proxy use_proxy=no'

alias poweroff="prompt2 'Shutdown?' 'poweroff'"
alias reboot="prompt2 'Reboot?' 'reboot'"

# scripts/utils
SCRIPTS_DIR='/home/ring/scripts'
alias t="http_proxy= https_proxy= $SCRIPTS_DIR/utils/ai_trans_demo.py"
alias osdoc="$SCRIPTS_DIR/utils/osdoc.sh"
