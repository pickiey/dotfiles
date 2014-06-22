#!/bin/bash

# to make silent on startup
MUTE_FILES=( mute-off.sh mute-on.sh)

for file in ${MUTE_FILES[@]}
do
  sudo cp $HOME/dotfiles/bin/$file /Library/Scripts/$file
  sudo chmod u+x /Library/Scripts/$file
done

sudo defaults write com.apple.loginwindow LogoutHook /Library/Scripts/mute-on.sh
sudo defaults write com.apple.loginwindow LoginHook /Library/Scripts/mute-off.sh


# for copy&paste
chmod u+x $HOME/dotfiles/bin/reattach-to-user-namespace

# for KeyRemap4MacBook
mkdir -p $HOME/Library/Application\ Support/KeyRemap4MacBook
cp private.xml $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml

# to install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

# to install some packages
#brew bundle
