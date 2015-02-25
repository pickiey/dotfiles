#!/bin/bash

if [ ! `uname` == "Darwin" ]; then
  echo "ERROR: This script is for OSX"
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
  echo -n "Install git, tmux, vim, w3m, zsh? (y/n) [y] : "
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
    brew install z zsh-syntax-highlighting
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
      sudo cp $HOME/dotfiles/bin/$file /Library/Scripts/$file
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
  # slate (window manager)
  # ============================================================================

  echo ""
  echo -n "Link .slate.js to \$HOME? (y/n) [y] : "
  read YN
  if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
    ln -sf $HOME/dotfiles/.slate.js $HOME/.slate.js
  fi

  # ============================================================================
  # Karabiner (key remapper)
  # ============================================================================

  echo ""
  echo -n "Setup Karabiner? (y/n) [y] : "
  read YN
  if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
    mkdir -p $HOME/Library/Application\ Support/Karabiner
    cp $HOME/dotfiles/private.xml $HOME/Library/Application\ Support/Karabiner
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





  echo ""
  echo "Configuration for GUI was done!"

fi





# ==============================================================================
# Show exit message
# ==============================================================================

echo ""
echo "All actions completed successfully. Exiting script now."

exit
