#!/bin/bash

# attach to an existing tmux session, or create one if none exist
# also set up access to the system clipboard from within tmux when possible

if [ -z $TMUX ]; then
  if $(tmux has-session 2>/dev/null); then
    tmux attach
  else
    if [[ ( $OSTYPE == darwin* ) && ( -x $(which reattach-to-user-namespace 2>/dev/null) ) ]]; then
      # on OS X force tmux's default command to spawn a shell in the user's namespace
      # https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
      tweaked_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
      if [ `tput cols` -gt 200 ]; then
        tmux -f <(echo "$tweaked_config") new-session \; split-window -h -d \; split-window \; clock-mode \; split-window -h \; resize-pane -L 18 \; select-pane -U \; resize-pane -D 12
      else
        tmux -f <(echo "$tweaked_config") new-session \; split-window \; clock-mode \; split-window -h \; resize-pane -L 18 \; select-pane -U \; resize-pane -D 12
      fi
    else
      if [ `tput cols` -gt 200 ]; then
        tmux new-session \; split-window -h -d \; split-window \; clock-mode \; split-window -h \; resize-pane -L 18 \; select-pane -U \; resize-pane -D 12
      else
        tmux new-session \; split-window \; clock-mode \; split-window -h \; resize-pane -L 18 \; select-pane -U \; resize-pane -D 12
      fi
    fi
  fi
fi

exit
