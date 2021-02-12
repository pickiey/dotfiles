#!/bin/bash

if [ -z $TMUX ]; then
    # 既にtmux起動済みの場合
    if $(tmux has-session 2>/dev/null); then
        tmux attach
    else
        terminal_width=`tput cols`
        # Macbook
        #   Font size == 10 -> 283
        width_threshold=200

        if [ $terminal_width -gt $width_threshold ]; then
            tmux new-session \; split-window -h \; split-window -v \; split-window -h -d \; split-window -v -d \; select-pane -U \; select-pane -L \; split-window -v  \; split-window -h -d \; split-window -v -d \; select-pane -U
        else
            tmux new-session \; split-window -v \; split-window -h -d \; split-window -v -d \; select-pane -U
        fi
    fi
fi

unset terminal_width
unset width_threshold

exit
