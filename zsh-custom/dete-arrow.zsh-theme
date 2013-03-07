if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR=${HOST_ACCENT:-blue}; fi

PROMPT='%{$fg[$NCOLOR]%}%3c ➤ %{$reset_color%}'
RPROMPT='%{$fg[$NCOLOR]%}%p $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
