#!/bin/bash

if [ ! `uname` == "Linux" ]; then
    echo "ERROR: This script is for Ubuntu"
    exit
fi


# Request git and brew
echo "Requesting git and brew... "

if [ ! `which git` -a `which brew` ]; then
    echo "ERROR: This script requires git and brew to run"
    exit
fi

chmod u+x $HOME/dotfiles/bin/brew_bundle.sh





# ==============================================================================
# CUI setting
# ==============================================================================

echo ""
echo -n "Would you like to setup CUI env? (y/n) [y] : "
read YN
if [ "$YN" == "y" ] || [ "$YN" == "" ]; then





    # ============================================================================
    # install some packages
    # ============================================================================

    echo ""
    echo -n "Install git, tmux, vim-nox, w3m, zsh? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        brew install git tmux vim w3m zsh
    fi

    # ============================================================================
    # Link dotfiles
    # ============================================================================

    DOT_FILES=(.zshrc .vimrc .tmux.conf .gitconfig .gitignore)

    echo ""
    echo -n "Link .zshrc, .vimrc, .tmux.conf .gitconfig .gitignore to \$HOME? (y/n) [y] : "
    read YN

    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        for file in ${DOT_FILES[@]}; do
            ln -sf $HOME/dotfiles/$file $HOME/$file
        done
    fi

    # ============================================================================
    # zsh
    # ============================================================================

    if [ -e $HOME/.linuxbrew/bin/zsh ]; then
        echo ""
        echo -n "Use zsh installed with linuxbrew? (y/n) [y] : "
        read YN
        if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
            sudo sh -c "echo '$HOME/.linuxbrew/bin/zsh' >> /etc/shells"
            chsh -s $HOME/.linuxbrew/bin/zsh
        fi
    fi

    echo ""
    echo -n "Setup zsh env? (y/n) [y] : "
    read YN

    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        brew install z zsh-completions zsh-history-substring-search zsh-syntax-highlighting zshdb
    fi

    # ============================================================================
    # neobundle.vim
    # ============================================================================

    echo ""
    echo -n "Setup neobundle.vim? (y/n) [y] : "
    read YN

    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        mkdir -p $HOME/.vim/bundle
        git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/neobundle.vim
    fi

    # ============================================================================
    # tmux
    # ============================================================================

    UTIL_FILES=(getCpuUsage.sh getMemUsage.sh tmuxx.sh)

    echo ""
    echo -n "Setup tmux env? (y/n) [y] : "
    read YN

    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        git clone https://github.com/erikw/tmux-powerline.git $HOME/.tmux/tmux-powerline
        cp $HOME/dotfiles/bin/default.sh $HOME/.tmux/tmux-powerline/themes/default.sh
        chmod u+x $HOME/.tmux/tmux-powerline/themes/default.sh

        for file in ${UTIL_FILES[@]}; do
            chmod u+x $HOME/dotfiles/bin/$file
        done
    fi

    # ============================================================================
    # disable filename localize
    # ============================================================================

    echo ""
    echo -n "Disable filename localize? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update
    fi

    # ============================================================================
    # disable guest session
    # ============================================================================

    echo ""
    echo -n "Disable guest session? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" > /usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'
    fi





    echo ""
    echo "Configuration for CUI was done!"

fi





# ==============================================================================
# GUI setting
# ==============================================================================

echo ""
echo -n "Would you like to setup GUI env? (y/n) [y] : "
read YN
if [ "$YN" == "y" ] || [ "$YN" == "" ]; then

    echo ""
    echo "Configuration for GUI was done!"

fi





# ==============================================================================
# Show exit message
# ==============================================================================

echo ""
echo "All actions completed successfully. Exiting script now."

exit
