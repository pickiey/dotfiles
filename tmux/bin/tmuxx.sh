#!/bin/bash

if [ -z $TMUX ]; then
    # 既にtmux起動済みの場合
    if $(tmux has-session 2>/dev/null); then
        tmux attach
    else
        terminal_width=`tput cols`
        width_threshold_macbook=250
        width_threshold_imac=500

        if   [ $terminal_width -lt $width_threshold_macbook ]; then
            tmux new-session    \; \
                split-window -v \; split-window -h    \; split-window -v -d \; select-pane  -L \; select-pane  -U

            #   タテに2分割 -> ヨコに2分割 -> タテに2分割
            #
            #   ---------
            #   |       |
            #   |   X   |
            #   |       |
            #   |-------|
            #   |   |   |
            #   |   |---|
            #   |   |   |
            #   ---------

        elif [ $terminal_width -lt $width_threshold_imac ]; then
            tmux new-session    \; \
                split-window -h \; \
                split-window -v \; split-window -h    \; split-window -v -d \; select-pane  -L \; select-pane  -L \; \
                split-window -v \; split-window -h -d \; split-window -v    \; clock-mode      \; select-pane  -U \; select-pane  -R \; select-pane  -U \; select-pane  -R

            # ヨコに2分割
            #   右半分を タテに2分割 -> ヨコに2分割 -> タテに2分割
            #   左半分を タテに2分割 -> ヨコに2分割 -> タテに2分割
            #
            #   -----------------
            #   |       |       |
            #   |       |   X   |
            #   |       |       |
            #   |-------+-------|
            #   |   |   |   |   |
            #   |---|   |   |---|
            #   | C |   |   |   |
            #   -----------------

        else
            tmux new-session    \; \
                split-window -h \; split-window -h    \; split-window -h    \; select-layout even-horizontal      \; \
                split-window -v \; split-window -h    \; split-window -v -d \; select-pane  -L \; select-pane  -L \; \
                split-window -v \; select-pane  -L    \; \
                split-window -v \; select-pane  -L    \; \
                split-window -v \; split-window -h -d \; split-window -v    \; clock-mode      \; select-pane  -U \; select-pane  -R \; select-pane  -U \; select-pane  -R \; select-pane  -R

            # ヨコに4分割 -> 幅を揃える
            #   1番右を       タテに2分割 -> ヨコに2分割 -> タテに2分割
            #   右から2番目を タテに2分割 -> ヨコに2分割 -> タテに2分割
            #
            #   ---------------------------------
            #   |       |       |       |       |
            #   |       |       |   X   |       |
            #   |       |       |       |       |
            #   |-------+-------+-------+-------|
            #   |   |   |       |       |   |   |
            #   |---|   |       |       |   |---|
            #   | C |   |       |       |   |   |
            #   ---------------------------------
        fi
    fi
fi

unset terminal_width
unset width_threshold_macbook
unset width_threshold_imac

exit
