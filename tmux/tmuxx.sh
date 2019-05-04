#!/bin/bash

# attach to an existing tmux session, or create one if none exist
# also set up access to the system clipboard from within tmux when possible



terminal_width=`tput cols`

# 1/3 threshold
#   Font size == 10 -> 82
#   Font size == 12 -> 68
one_three_threshold=100

# 2/3 threshold
#   Font size == 10 -> 170
#   Font size == 12 -> 141
two_three_threshold=200

if [ -z $TMUX ]; then
    if $(tmux has-session 2>/dev/null); then
        tmux attach
    else
        if [[ ( $OSTYPE == darwin* ) && ( -x $(which reattach-to-user-namespace 2>/dev/null) ) ]]; then
            # on OS X force tmux's default command to spawn a shell in the user's namespace
            # https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
            tweaked_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))

            if [ $terminal_width -gt $two_three_threshold ]; then
                tmux -f <(echo "$tweaked_config") new-session \; split-window -h \; split-window -h -d \; select-layout even-horizontal
            elif [ $terminal_width -gt $one_three_threshold ]; then
                tmux -f <(echo "$tweaked_config") new-session \; split-window -h
            else
                tmux -f <(echo "$tweaked_config") new-session
            fi

        else
            if [ $terminal_width -gt $two_three_threshold ]; then
                tmux new-session \; split-window -h \; split-window -h -d \; select-layout even-horizontal
            elif [ $terminal_width -gt $one_three_threshold ]; then
                tmux new-session \; split-window -h
            else
                tmux new-session
            fi
        fi
    fi
fi

unset terminal_width
unset one_three_threshold
unset two_three_threshold

exit
