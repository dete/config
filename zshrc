# oh-my-zsh configuration options
ZSH_THEME="arrow"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

# My Path
export PATH=~/config/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

# Use vim and vimless
if /usr/bin/which -s vless ; then
   export PAGER=vless
   alias less=vless
   alias more=vless
fi

if /usr/bin/which -s vmanpager ; then
   export MANPAGER=vmanpager
fi

if /usr/bin/which -s vim ; then
   export EDITOR=vim
   alias vi=vim
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