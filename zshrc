# oh-my-zsh configuration options
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dete-arrow"
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM=~/config/zsh-custom

plugins=(brew git-extras history-substring-search)

source $ZSH/oh-my-zsh.sh

# My Path
export PATH="$HOME/config/bin${PATH+:$PATH}"


# Automatically display 'time' stats when a process takes more than 10 seconds
TIMEFMT='User: %U  Kernel: %S  Real: %*E  Load:%P Mem:%M'
REPORTTIME=10

# Use vim and vimless
#if which vless >& /dev/null ; then
   #export PAGER=`which vless`
   #alias less=vless
   #alias more=vless
#fi

if which vmanpager >& /dev/null ; then
   export MANPAGER=`which vmanpager`
fi

if which vim >& /dev/null ; then
   export EDITOR=`which vim`
   alias vi=vim
fi

# Other useful aliases
alias du1="du -h -d1"
alias 0="cd ~0"

# I want lots of scrollback history
HISTFILE=~/.zshhistory
HISTSIZE=3000
SAVEHIST=3000
DIRSTACKSIZE=10

# Remove any extant alias for LS (oh-my-zsh adds one)
if alias ls >& /dev/null ; then
   unalias ls
fi

# Use gls if it exists (it wouldn't exist if we didn't need it!)
if which gls >& /dev/null ; then
   LSPATH=`which gls`
else
   LSPATH=`which ls`
fi

# find those LS options which "this LS" supports
LSOPTS=''
if $LSPATH --color=auto / >&/dev/null; then
  LSOPTS=$LSOPTS' --color=auto'
elif $LSPATH -G / >&/dev/null; then
  LSOPTS=$LSOPTS' -G'
fi

if $LSPATH -F / >&/dev/null; then
  LSOPTS=$LSOPTS' -F'
fi

if $LSPATH -h / >&/dev/null; then
  LSOPTS=$LSOPTS' -h'
fi

# Create our standard LS alias
alias ls="${LSPATH}${LSOPTS}"

# Use dircolors (or gdircolors) if it exists
DIRC='dummy'

if which gdircolors >& /dev/null ; then
   DIRC=`which gdircolors`
elif which dircolors >& /dev/null ; then
   DIRC=`which dircolors`
fi

if [ -x $DIRC ] && [ -e ~/config/dircolors ] ; then
   # sets the LS_COLORS variable (used by gls)
   eval $( $DIRC ~/config/dircolors )

   # tell zsh's completion code to use those same colors
   zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi

# A clever replacement for CD that will work even if the target is a file
cd () {
  if (( $# != 1 )); then
    builtin cd "$@"
    return
  fi

  if [[ -f "$1" ]]; then
    builtin cd "$1:h"
  else
    builtin cd "$1"
  fi
}

autoload zmv
alias mmv='noglob zmv -W'

# Key-bindings
#autoload up-line-or-beginning-search
#autoload down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#bindkey "^[[A" up-line-or-beginning-search
#bindkey "^[[B" down-line-or-beginning-search

bindkey '^[q' push-line-or-edit
bindkey '^G' list-expand

bindkey '^z' undo
bindkey '^r' redo
   
# Run any platform specific code
case `uname -s` in
   Darwin)
      test -f ~/config/zshrc-mac && source ~/config/zshrc-mac
      ;;

   Linux)
      test -f ~/config/zshrc-linux && source ~/config/zshrc-linux
      ;;

   *)
      echo "WARNING: Unknown OS"
      ;;
esac
