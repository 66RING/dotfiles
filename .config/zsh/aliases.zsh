#    ___    ___                     
#   /   |  / (_)___ _________  _____
#  / /| | / / / __ `/ ___/ _ \/ ___/
# / ___ |/ / / /_/ (__  )  __(__  ) 
#/_/  |_/_/_/\__,_/____/\___/____/  
#                                   
# Author: github@66RING

alias c='clear' \
	cp='cp -iv' \
	grep='grep --color' \
	egrep='egrep --color' \
	g='git' \
	gct='git clone --depth=1' \
	ggl='git log --graph --pretty=oneline --abbrev-commit' \
	ls='ls --color' \
	ll='ls -l' \
	md='mkdir' \
	mf='touch' \
	sudo='doas' \
	sctl='systemctl' \
	bctl='bluetoothctl' 
#
# APPs
alias yg='you-get' \
	top='htop' \
	vim='nvim' \
	s vi='nvim' \
	s='neofetch | lolcat' \
	ra='ranger' \
	lg='lazygit' \
	tl='proxyon && tldr' \
	ct='cht.sh' \
	py='python' \
	pc='proxyon && '


#************************
#* tools
#************************
proxy_servce='http://127.0.0.1:7890'
alias venvon="source $(which virtualenvwrapper.sh)" \
	proxyon='export http_proxy="$proxy_servce" export https_proxy="$proxy_servce" export use_proxy=yes' \
	proxyoff='unset http_proxy  unset https_proxy use_proxy' \
	poweroff="prompt2 'Shutdown?' 'poweroff'" \
	reboot="prompt2 'Reboot?' 'reboot'"

# scripts/utils
SCRIPTS_DIR='~/.local/bin/scripts'
alias t="http_proxy= https_proxy= $SCRIPTS_DIR/utils/ai_trans_demo.py" \
	osdoc="$SCRIPTS_DIR/utils/osdoc.sh"
# alias bc="$SCRIPTS_DIR/utils/calc"
