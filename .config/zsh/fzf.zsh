#     ____      ____
#    / __/___  / __/
#   / /_/_  / / /_
#  / __/ / /_/ __/
# /_/   /___/_/
#
# - <Ctrl-r>  fzf-history-widget             
# - <Ctrl-t>  fzf-cd-widget      
# - <Ctrl-f>  fzf-find-widget
# - <Ctrl-p>  find-in-file
#
export FZF_DEFAULT_OPTS='--bind=ctrl-t:top,change:top --bind ctrl-e:down,ctrl-u:up --preview "highlight -O ansi -l {} 2> /dev/null" --reverse'
# export FZF_DEFAULT_OPTS='--bind ctrl-e:down,ctrl-u:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
# export FZF_DEFAULT_COMMAND='rg --files-with-matches --no-messages .'
# export FZF_COMPLETION_TRIGGER='\'
# export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'


_fzf_fpath=${0:h}/fzf
fpath+=$_fzf_fpath
autoload -U $_fzf_fpath/*(.:t)
unset _fzf_fpath

fzf-redraw-prompt() {
	local precmd
	for precmd in $precmd_functions; do
		$precmd
	done
	zle reset-prompt
}
zle -N fzf-redraw-prompt

zle -N fzf-find-widget
# bindkey '^f' fzf-find-widget

fzf-cd-widget() {
	local tokens=(${(z)LBUFFER})
	if (( $#tokens <= 1 )); then
		zle fzf-find-widget 'only_dir'
		if [[ -d $LBUFFER ]]; then
			cd $LBUFFER
			local ret=$?
			LBUFFER=
			zle fzf-redraw-prompt
			return $ret
		fi
	fi
}
zle -N fzf-cd-widget
bindkey '^t' fzf-cd-widget

fzf-history-widget() {
	local num=$(fhistory $LBUFFER)
	local ret=$?
	if [[ -n $num ]]; then
		zle vi-fetch-history -n $num
	fi
	zle reset-prompt
	return $ret
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

find-file() {
	LBUFFER=$LBUFFER$(rg --files-with-matches --no-messages \. | fzf --preview "highlight -O ansi -l {} 2> /dev/null")
	zle reset-prompt
}
zle -N find-file
bindkey '^f' find-file

find-in-file() {
	LBUFFER=$LBUFFER$(rg \. | fzf --delimiter : --preview 'rg --ignore-case --colors 'match:bg:yellow' --pretty -F --context 10 {2..} -- {1}' | cut -d: -f1)
	zle reset-prompt
}
zle -N find-in-file
bindkey '^p' find-in-file
