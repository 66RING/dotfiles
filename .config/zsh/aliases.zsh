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
	bctl='bluetoothctl'  \
	yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
	zsh='exec zsh'
#
# APPs
alias yg='you-get' \
	top='htop' \
	vim='nvim' \
	s vi='nvim' \
	s='neofetch' \
	ra='ranger' \
	lg='lazygit' \
	tl='proxyon && tldr' \
	ct='cht.sh' \
	py='python' \
	jl='julia' \
	wget='axel -n 6' \
	pc='proxyon && '

# modern unix
alias diff='delta' \
	cat='bat'

#************************
#* tools
#************************
proxy_servce='http://127.0.0.1:7890'
prompt2=$SCRIPTS_DIR/global/prompt2
alias venvon="source $(which virtualenvwrapper.sh)" \
	proxyon='export http_proxy="$proxy_servce" export https_proxy="$proxy_servce" export use_proxy=yes' \
	proxyoff='unset http_proxy  unset https_proxy use_proxy' \
	poweroff="$prompt2 'Shutdown?' 'doas poweroff'" \
	reboot="$prompt2 'Reboot?' 'doas reboot'"

# scripts/utils
alias t="http_proxy= https_proxy= $SCRIPTS_DIR/utils/ai_trans_demo.py" \
	osdoc="$SCRIPTS_DIR/utils/osdoc.sh" \
	anydoc="$SCRIPTS_DIR/utils/anydoc.sh" \
	topdf="$SCRIPTS_DIR/utils/topdf.sh"
# shortcut for check syslog in artix
alias j='f(){DIR=${1:-everything};vim -c "set filetype=messages" /var/log/$DIR.log; unset -f f};f'
