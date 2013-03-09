if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR=${HOST_ACCENT:-blue}; fi

# display the return code ONCE if non-zero
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%} )"
return_code_disabled=''
return_code=$return_code_enabled

function accept-line-or-clear-warning () {
	if [[ -z $BUFFER ]]; then
		return_code=$return_code_disabled
	else
		return_code=$return_code_enabled
	fi
	zle accept-line
}

zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning

PROMPT='%{$fg[$NCOLOR]%}%3c ➤ %{$reset_color%}'
RPROMPT='${return_code}%{$fg[$NCOLOR]%}%p $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# vim set ft=zsh
