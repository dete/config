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

_byobu_sourced=1 . /usr/local/Cellar/byobu/5.30/bin/byobu-launch
