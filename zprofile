if [ ! -r ~/.hostaccent ] ; then
   all_colors=("green" "yellow" "blue" "cyan" "magenta")
   N=${#all_colors[@]}
   ((N=(RANDOM%N)+1))
   echo ${all_colors[$N]} > ~/.hostaccent
fi

if [ -r ~/.hostaccent ] ; then
   read HOST_ACCENT < ~/.hostaccent
else
   HOST_ACCENT="yellow"
fi

export HOST_ACCENT

if [ -x /opt/homebrew/bin/brew ] ; then
   eval $(/opt/homebrew/bin/brew shellenv)
fi

if which brew >& /dev/null ; then
   export BYOBU_PREFIX=$(brew --prefix)
fi

if [ -s /opt/homebrew/opt/nvm/nvm.sh ] ; then
   source /opt/homebrew/opt/nvm/nvm.sh
fi

if [ -x /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm ] ; then
   source /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm
fi
