# oh-my-zsh configuration options
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="arrow"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# My Path
export PATH=~/config/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

# Automatically display 'time' stats when a process takes more than 10 seconds
TIMEFMT='User: %U  Kernel: %S  Real: %*E  Load:%P Mem:%M'
REPORTTIME=10

# Use vim and vimless
if which vless >& /dev/null ; then
   export PAGER=`which vless`
   alias less=vless
   alias more=vless
fi

if which vmanpager >& /dev/null ; then
   export MANPAGER=`which vmanpager`
fi

if which vim >& /dev/null ; then
   export EDITOR=`which vim`
   alias vi=vim
fi

# I want lots of scrollback history
HISTFILE=~/.zshhistory
HISTSIZE=3000
SAVEHIST=3000
DIRSTACKSIZE=10

# Configure ls
if which gls >& /dev/null ; then
   LSPATH=`which gls`
else
   LSPATH=`which ls`
fi

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

alias ls="${LSPATH}${LSOPTS}"

DIRC=''

if which gdircolors >& /dev/null ; then
   DIRC=`which gdircolors`
elif which dircolors >& /dev/null ; then
   DIRC=`which dircolors`
fi

if [ -x $DIRC ] && [ -e ~/config/dircolors ] ; then
   eval $( $DIRC ~/config/dircolors )
fi
   
# Run any platform specific code
case `uname -s` in
   Darwin)
      test -f ~/config/zshrc.mac && source ~/config/zshrc.mac
      ;;

   Linux)
      test -f ~/config/zshrc.linux && source ~/config/zshrc.linux
      ;;

   *)
      echo "WARNING: Unknown OS"
      ;;
esac
