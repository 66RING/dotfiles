export KEYTIMEOUT=1

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  # update keymap variable for the prompt
  VI_KEYMAP=$KEYMAP

  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi-accept-line() {
  VI_KEYMAP=main
  zle accept-line
}

zle -N vi-accept-line


bindkey -v

# use custom accept-line widget to update $VI_KEYMAP
bindkey -M vicmd '^J' undefined-key
bindkey -M vicmd '^M' vi-accept-line  # NEED!

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char  # NEED!
bindkey '^w' backward-kill-word

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey -M viins '^j' beginning-of-line
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^l' end-of-line
bindkey -M viins '^e' end-of-line

bindkey -M vicmd "h" vi-insert
bindkey -M vicmd "H" vi-insert-bol
bindkey -M vicmd "j" vi-backward-char
bindkey -M vicmd "l" vi-forward-char
bindkey -M vicmd "J" vi-backward-word
bindkey -M vicmd "L" vi-forward-word
bindkey -M vicmd "k" down-line-or-history
bindkey -M vicmd "i" up-line-or-history
bindkey -M vicmd "I" up-line-or-history
bindkey -M vicmd "gg" vi-beginning-of-line
bindkey -M vicmd "G" vi-end-of-line
bindkey -M vicmd "u" undo

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

