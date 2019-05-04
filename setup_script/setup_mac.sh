#!/bin/bash

if [ ! `uname` == "Darwin" ]; then
    echo "ERROR: This script is for macOS"
    exit
fi


# Request git and brew
echo "Requesting git and brew... "

if [ ! `which git` -a `which brew` ]; then
    echo "ERROR: This script requires git and brew to run"
    exit
fi

dir=$HOME/.dotfiles





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
    echo -n "Install git, neovim, tmux, zsh? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        brew install git neovim tmux zsh
    fi

    # ============================================================================
    # Link dotfiles
    # ============================================================================

    echo ""
    echo -n "Link .zshrc, .vimrc, .tmux.conf .gitconfig .gitignore to \$HOME? (y/n) [y] : "
    read YN

    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        ln -sf $dir/zsh/init.zsh $HOME/.zshrc
        ln -sf $dir/nvim/init.vim $HOME/.vimrc
        ln -sf $dir/tmux/tmux.conf $HOME/.tmux.conf
        ln -sf $dir/git/gitconfig $HOME/.gitconfig
        ln -sf $dir/git/gitignore $HOME/.gitignore
    fi

    # ============================================================================
    # zsh
    # ============================================================================

    if [ -e /usr/local/bin/zsh ]; then
        echo ""
        echo -n "Use zsh installed with homebrew? (y/n) [y] : "
        read YN
        if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
            sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
            chsh -s /usr/local/bin/zsh
        fi
    fi

    echo ""
    echo -n "Setup zsh env? (y/n) [y] : "
    read YN

    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        brew install z zsh-completions zsh-history-substring-search zsh-syntax-highlighting zshdb
    fi

    # ============================================================================
    # neovim
    # ============================================================================

    echo ""
    echo -n "Setup neovim env? (y/n) [y] : "
    read YN

    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        mkdir -p $HOME/.cache
        git clone https://github.com/Shougo/dein.vim $HOME/.cache/dein.vim

        mkdir -p $HOME/.config/nvim
        ln -sf $dir/nvim/init.vim $HOME/.config/nvim/init.vim
    fi

    # ============================================================================
    # tmux
    # ============================================================================

    UTIL_FILES=(default.sh getCpuUsage.sh getMemUsage.sh tmuxx.sh)

    echo ""
    echo -n "Setup tmux env? (y/n) [y] : "
    read YN

    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        git clone https://github.com/erikw/tmux-powerline.git $HOME/.tmux/tmux-powerline
        ln -sf $dir/tmux/default.sh $HOME/.tmux/tmux-powerline/themes/default.sh

        for file in ${UTIL_FILES[@]}; do
            chmod u+x $dir/tmux/$file
        done
    fi

    # ============================================================================
    # disable filename localize
    # ============================================================================

    echo ""
    echo -n "Disable filename localize? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        sudo mv /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/SystemFolderLocalizations.strings /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/SystemFolderLocalizations.strings.disable && sudo cp /System/Library/CoreServices/SystemFolderLocalizations/en.lproj/SystemFolderLocalizations.strings /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/
    fi

    # ============================================================================
    # make silent on startup
    # ============================================================================

    MUTE_FILES=(mute-off.sh mute-on.sh)
    echo ""
    echo -n "Make silent on startup? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        for file in ${MUTE_FILES[@]}; do
            sudo cp $dir/macos/$file /Library/Scripts/$file
            sudo chmod u+x /Library/Scripts/$file
        done
        sudo defaults write com.apple.loginwindow LogoutHook /Library/Scripts/mute-on.sh
        sudo defaults write com.apple.loginwindow LoginHook /Library/Scripts/mute-off.sh
    fi

    # ============================================================================
    # copy&paste
    # ============================================================================

    echo ""
    echo -n "Install reattach-to-user-namespace (for copy&paste)? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        brew install reattach-to-user-namespace
    fi

    # ============================================================================
    # HostName
    # ============================================================================

    echo ""
    echo -n "Set HostName to \"Macbook\"? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        sudo scutil --set ComputerName Macbook
        sudo scutil --set LocalHostName Macbook
        sudo scutil --set HostName Macbook
    fi

    # ============================================================================
    # slate (window manager)
    # ============================================================================

    echo ""
    echo -n "Link .slate.js to \$HOME? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        ln -sf $dir/slate/slate.js $HOME/.slate.js
    fi

    # ============================================================================
    # Karabiner-Elements (key remapper)
    # ============================================================================

    echo ""
    echo -n "Setup Karabiner-Elements? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
        mkdir -p $HOME/.config/karabiner
        ln -sf $dir/karabiner/karabiner.json $HOME/.config/karabiner/karabiner.json
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





    # ============================================================================
    # Happy Hacking OSX!
    # http://tukaikta.blog135.fc2.com/blog-entry-251.html
    # ============================================================================

    # on mouseover, focus window
    defaults write com.apple.Terminal FocusFollowsMouse -boolean true
    #defaults delete com.apple.Terminal FocusFollowsMouse

    chflags nohidden ~/Library
    #chflags hidden ~/Library

    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
    #defaults delete com.apple.finder _FXShowPosixPathInTitle

    defaults write com.apple.finder QLEnableTextSelection -bool true
    #defaults delete com.apple.finder QLEnableTextSelection

    defaults write com.apple.finder QLHidePanelOnDeactivate -bool true
    #defaults delete com.apple.finder QLHidePanelOnDeactivate

    defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
    #defaults delete -g NSNavPanelExpandedStateForSaveMode

    defaults write -g PMPrintingExpandedStateForPrint -bool true
    #defaults delete -g PMPrintingExpandedStateForPrint

    defaults write -g NSWindowResizeTime 0.1
    #defaults delete -g NSWindowResizeTime

    defaults write com.apple.finder AutoStopWhenSelectionChanges -bool false
    #defaults delete com.apple.finder AutoStopWhenSelectionChanges

    defaults write com.apple.finder AutoStopWhenScrollingOffBounds -bool false
    #defaults delete com.apple.finder AutoStopWhenScrollingOffBounds

    defaults write com.apple.finder QLInlinePreviewMinimumSupportedSize -int 0
    #defaults delete com.apple.finder QLInlinePreviewMinimumSupportedSize

    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    #defaults delete com.apple.desktopservices DSDontWriteNetworkStores

    defaults write com.apple.CrashReporter DialogType none
    #defaults delete com.apple.CrashReporter DialogType

    defaults write com.apple.dock showhidden -bool true
    #defaults delete com.apple.dock showhidden

    defaults write com.apple.dock mouse-over-hilite-stack -bool true
    #defaults delete com.apple.dock mouse-over-hilite-stack

    defaults write com.apple.dashboard mcx-disabled -bool true
    #defaults delete com.apple.dashboard mcx-disabled

    defaults write com.apple.screencapture disable-shadow -bool true
    #defaults delete com.apple.screencapture disable-shadow

    defaults write com.apple.screencapture name Capture
    #defaults delete com.apple.screencapture name

    defaults write com.apple.screencapture location ~/Pictures
    #defaults delete com.apple.screencapture location

    defaults write com.apple.dock size-immutable -boolean true
    #defaults delete com.apple.dock size-immutable





    echo ""
    echo "Configuration for GUI was done!"

fi





# ==============================================================================
# Show exit message
# ==============================================================================

unset dir

echo ""
echo "All actions completed successfully. Exiting script now."

exit
