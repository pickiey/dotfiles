#!/bin/bash

# attach to an existing tmux session, or create one if none exist
# also set up access to the system clipboard from within tmux when possible

if [ -z $TMUX ]; then
  if $(tmux has-session 2> /dev/null); then
    tmux attach
  else
    if [[ ( $OSTYPE == darwin* ) && ( -x $(which reattach-to-user-namespace 2>/dev/null) ) ]]; then
      # on OS X force tmux's default command to spawn a shell in the user's namespace
      # https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
      tweaked_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))

      tmux -f <(echo "$tweaked_config") new-session \; split-window -h \; resize-pane -L 30 \; split-window -d \; resize-pane -D 10 \; split-window -h \; select-pane -D \; split-window -h -d \; resize-pane -R 20 \; select-pane -R \; clock-mode \; select-pane -L \; select-pane -U \; select-pane -L \; select-pane -L

    else

      tmux new-session \; split-window -h \; resize-pane -L 30 \; split-window -d \; resize-pane -D 10 \; split-window -h \; select-pane -D \; split-window -h -d \; resize-pane -R 20 \; select-pane -R \; clock-mode \; select-pane -L \; select-pane -U \; select-pane -L

    fi
  fi
fi
