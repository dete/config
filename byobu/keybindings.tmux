unbind-key -n C-a
set -g prefix ^G
set -g prefix2 ^G
bind g send-prefix

bind-key -n NPage copy-mode \; send-keys NPage
bind-key -n PPage copy-mode \; send-keys PPage
bind-key -n End send-keys q
bind-key -n Home copy-mode \; send-keys g
