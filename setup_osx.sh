#!/bin/bash

# disable filename localize
sudo mv /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/SystemFolderLocalizations.strings /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/SystemFolderLocalizations.strings.disable
sudo cp /System/Library/CoreServices/SystemFolderLocalizations/en.lproj/SystemFolderLocalizations.strings /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/

# show Library
chflags nohidden ~/Library

# on mouseover, focus window
defaults write com.apple.Terminal FocusFollowsMouse -boolean true
#defaults delete com.apple.Terminal FocusFollowsMouse


# in QuickLook, enable text selection
defaults write com.apple.Finder QLEnableTextSelection -bool YES
#defaults delete com.apple.Finder QLEnableTextSelection

# make silent on startup
MUTE_FILES=( mute-off.sh mute-on.sh)

for file in ${MUTE_FILES[@]}
do
  sudo cp $HOME/dotfiles/bin/$file /Library/Scripts/$file
  sudo chmod u+x /Library/Scripts/$file
done

sudo defaults write com.apple.loginwindow LogoutHook /Library/Scripts/mute-on.sh
sudo defaults write com.apple.loginwindow LoginHook /Library/Scripts/mute-off.sh

# change shell
chsh -s /bin/zsh
#sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"
#chsh -s /usr/local/bin/zsh

# for copy&paste
chmod u+x $HOME/dotfiles/bin/reattach-to-user-namespace

# for KeyRemap4MacBook
mkdir -p $HOME/Library/Application\ Support/KeyRemap4MacBook
cp $HOME/dotfiles/private.xml $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

# install Fonts
#cp MyFontFile-Powerline.otf ~/Library/Fonts

# install some packages
#brew bundle
