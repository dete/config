unbind-key -n C-a
set -g prefix ^G
set -g prefix2 ^G
bind g send-prefix

bind-key -n NPage copy-mode \; send-keys NPage
bind-key -n PPage copy-mode \; send-keys PPage
bind-key -n End send-keys q
bind-key -n Home copy-mode \; send-keys g

bind-key -n F1 select-window -t:1
bind-key -n F2 select-window -t:2
bind-key -n F3 select-window -t:3
bind-key -n F4 select-window -t:4
bind-key -n F5 select-window -t:5
bind-key -n F6 select-window -t:6
bind-key -n F7 select-window -t:7
bind-key -n F8 select-window -t:8
bind-key -n F9 select-window -t:9
