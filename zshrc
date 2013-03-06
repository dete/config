ZSH_THEME="arrow"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

export PATH=~/config/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl

if [ -x `which vless` ] ; then
   export PAGER=vless
   alias less=vless
   alias more=vless
fi

if [ -x `which vmanpager` ] ; then
   export MANPAGER=vmanpager
fi

case `uname -s` in
   Darwin)
   echo "It's a mac!"
   ;;

   Linux)
   echo "It's linux!"
   ;;

   *)
   echo "Unknown OS; aborting"
   exit 0
   ;;
esac
