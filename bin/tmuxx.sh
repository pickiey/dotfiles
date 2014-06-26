#!/bin/bash

# attach to an existing tmux session, or create one if none exist
# also set up access to the system clipboard from within tmux when possible

if [[ ( $OSTYPE == darwin* ) && ( -x $(which reattach-to-user-namespace 2>/dev/null) ) ]]; then
  # on OS X force tmux's default command to spawn a shell in the user's namespace
  # https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
  tweaked_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))

  # 5分割
  tmux attach || (tmux -f <(echo "$tweaked_config") new-session \; split-window -h \; resize-pane -L 30 \; split-window -d \; resize-pane -D 10 \; split-window -h \; select-pane -D \; split-window -h -d \; resize-pane -R 20 \; select-pane -R \; clock-mode \; select-pane -L \; select-pane -U \; select-pane -L \; select-pane -L)

  # 3分割
  #tmux attach || (tmux -f <(echo "$tweaked_config") new-session \; split-window -h \; split-window \; clock-mode \; select-pane -U \; select-pane -L)

else

  # 5分割
  tmux attach || (tmux new-session \; split-window -h \; resize-pane -L 30 \; split-window -d \; resize-pane -D 10 \; split-window -h \; select-pane -D \; split-window -h -d \; resize-pane -R 20 \; select-pane -R \; clock-mode \; select-pane -L \; select-pane -U \; select-pane -L \; select-pane -L)

  # 3分割
  #tmux attach || (tmux new-session \; split-window -h \; split-window \; clock-mode \; select-pane -U \; select-pane -L)

fi
