PROMPT="%B%(?:%{$fg[red]%}[%{$fg[magenta]%}%n%{$fg[yellow]%}@%{$fg[blue]%}%m %{$fg[green]%}%c%{$fg[cyan]%}]%{$fg[white]%}%%:%{$fg[red]%}[%n@%m %c]%%)"
PROMPT+="%{$reset_color%}%b "
RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}✔"

