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
alias m='neomutt'
alias md='mkdir'
alias mf='touch'
alias pc='proxychains'
# alias qrcp='qrcp -k'
alias ra='ranger'
alias rm='rm -I'
alias sctl='systemctl'
alias s='neofetch | lolcat'
alias top='htop'
alias vim='nvim'
alias vi='nvim'
alias yg='you-get'


#************************
#* tools
#************************
alias venvon="source $(which virtualenvwrapper.sh)"
alias proxyon='export http_proxy="127.0.0.1:12333" export https_proxy="127.0.0.1:12333"'
alias proxyoff='unset http_proxy ; unset export https_proxy'

alias t="$HOME/scripts/tools/ai_trans_demo.py"

alias poweroff="prompt2 'Shutdown?' 'poweroff'"
alias reboot="prompt2 'Reboot?' 'reboot'"
