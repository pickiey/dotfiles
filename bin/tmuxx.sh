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
        #tmux -f <(echo "$tweaked_config") new-session \; split-window -h \; split-window \; split-window -h \; clock-mode \; select-pane -L \; resize-pane -R 18 \; select-pane -U \; resize-pane -D 12 \; select-pane -L \; split-window \; split-window -h \; clock-mode \; select-pane -L \; resize-pane -R 18 \; select-pane -U \; resize-pane -D 12
        tmux -f <(echo "$tweaked_config") new-session \; split-window -h \; split-window \; split-window -h \; clock-mode \; select-pane -L \; resize-pane -R 18 \; select-pane -U \; resize-pane -D 12 \; select-pane -L \; clock-mode \; split-window \; resize-pane -U 12 \; select-pane -U \; split-window -h \; resize-pane -L 18

      else
        tmux -f <(echo "$tweaked_config") new-session \; clock-mode \; split-window \; resize-pane -U 12 \; select-pane -U \; split-window -h \; resize-pane -L 18
      fi

    else

      if [ `tput cols` -gt 200 ]; then
        #tmux new-session \; split-window -h \; resize-pane -L 30 \; split-window \; split-window -h \; clock-mode \; select-pane -L \; resize-pane -R 18 \; select-pane -U \; resize-pane -D 12 \; split-window -h -d \; select-pane -L

        tmux new-session \; split-window -h \; split-window \; split-window -h \; clock-mode \; select-pane -L \; resize-pane -R 18 \; select-pane -U \; resize-pane -D 12 \; select-pane -L \; split-window \; split-window -h \; clock-mode \; select-pane -L \; resize-pane -R 18 \; select-pane -U \; resize-pane -D 12

      else
        tmux new-session \; clock-mode \; split-window \; resize-pane -U 12 \; select-pane -U \; split-window -h \; resize-pane -L 18
      fi

    fi

  fi
fi

exit
