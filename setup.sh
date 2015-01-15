#!/bin/bash

# Request git and brew
echo "Requesting git and brew... "

if [ ! `which git` -a `which brew` ]; then
    echo "ERROR: This script requires git and brew to run"
    exit
fi

chmod u+x $HOME/dotfiles/setup_util.sh
chmod u+x $HOME/dotfiles/brew_bundle.sh





# ==============================================================================
# Setup zsh-syntax-highlighting
# ==============================================================================
echo ""
echo -n "Setup zsh-syntax-highlighting? (y/n) [y] : "
read YN

if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
fi





# ==============================================================================
# Setup neobundle.vim
# ==============================================================================
echo ""
echo -n "Setup neobundle.vim? (y/n) [y] : "
read YN

if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
  mkdir -p $HOME/.vim/bundle
  git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/neobundle.vim
fi





# ==============================================================================
# Setup tmux-powerline
# ==============================================================================
UTIL_FILES=( getCpuUsage.sh getMemUsage.sh tmuxx.sh)

echo ""
echo -n "Setup tmux-powerline? (y/n) [y] : "
read YN

if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
  git clone https://github.com/erikw/tmux-powerline.git $HOME/.tmux/tmux-powerline
  cp $HOME/dotfiles/bin/default.sh $HOME/.tmux/tmux-powerline/themes/default.sh
  chmod u+x $HOME/.tmux/tmux-powerline/themes/default.sh

  for file in ${UTIL_FILES[@]}; do
    chmod u+x $HOME/dotfiles/bin/$file
  done
fi





# ==============================================================================
# Link dotfiles
# ==============================================================================
DOT_FILES=(.zshrc .vimrc .tmux.conf .gitconfig .gitignore)

echo ""
echo -n "Link .zshrc, .vimrc, .tmux.conf .gitconfig .gitignore to \$HOME? (y/n) [y] : "
read YN

if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
  for file in ${DOT_FILES[@]}; do
    ln -sf $HOME/dotfiles/$file $HOME/$file
  done
fi





# ==============================================================================
# Setting for OS X
# ==============================================================================
if [ `uname` == "Darwin" ]; then

  # disable filename localize
  echo ""
  echo -n "Disable filename localize? (y/n) [y] : "
  read YN
  if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
    sudo mv /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/SystemFolderLocalizations.strings /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/SystemFolderLocalizations.strings.disable && sudo cp /System/Library/CoreServices/SystemFolderLocalizations/en.lproj/SystemFolderLocalizations.strings /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/
  fi

  # make silent on startup
  MUTE_FILES=( mute-off.sh mute-on.sh)
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

  # for copy&paste
  echo ""
  echo -n "Chmod reattach-to-user-namespace (for copy&paste)? (y/n) [y] : "
  read YN
  if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
    chmod u+x $HOME/dotfiles/bin/reattach-to-user-namespace
  fi

  # change shell
  echo ""
  echo -n "Use zsh? (y/n) [y] : "
  read YN
  if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
    chsh -s /bin/zsh
  fi

  # slate (window manager)
  echo ""
  echo -n "Link .slate.js to \$HOME? (y/n) [y] : "
  read YN
  if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
    ln -sf $HOME/dotfiles/.slate.js $HOME/.slate.js
  fi

  # install some packages
  echo ""
  echo -n "Install some packages? (y/n) [y] : "
  read YN
  if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
    brew install git tmux w3m z zsh
  fi

  # change shell
  if [ -e /usr/local/bin/zsh ]; then
    echo ""
    echo -n "Use zsh installed with homebrew? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
      chsh -s /usr/local/bin/zsh
    fi
  fi

  # Karabiner (key remapper)
  echo ""
  echo -n "Setup Karabiner? (y/n) [y] : "
  read YN
  if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
    mkdir -p $HOME/Library/Application\ Support/Karabiner
    cp $HOME/dotfiles/private.xml $HOME/Library/Application\ Support/Karabiner
  fi

fi





# ==============================================================================
# Setting for Ubuntu
# ==============================================================================
if [ `uname` == "Linux" ]; then

  # disable filename localize
  echo ""
  echo -n "Disable filename localiz? (y/n) [y] : "
  read YN
  if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
    env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update
  fi

  # disable guest session
  echo ""
  echo -n "Disable guest session? (y/n) [y] : "
  read YN
  if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
    sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" > /usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'
  fi

  # change shell
  if [ -e /usr/bin/zsh ]; then
    echo ""
    echo -n "Use zsh installed with linuxbrew? (y/n) [y] : "
    read YN
    if [ "$YN" == "y" ] || [ "$YN" == "" ]; then
      chsh -s /usr/bin/zsh
    fi
  fi

fi





# ==============================================================================
# Show exit message
# ==============================================================================
echo ""
echo "All actions completed successfully. Exiting script now."

exit
