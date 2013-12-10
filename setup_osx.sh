#!/bin/bash

MUTE_FILES=( mute-off.sh mute-on.sh)

for file in ${MUTE_FILES[@]}
do
  sudo cp $HOME/dotfiles/bin/$file /Library/Scripts/$file
  sudo chmod u+x /Library/Scripts/$file
done

sudo defaults write com.apple.loginwindow LogoutHook /Library/Scripts/mute-on.sh
sudo defaults write com.apple.loginwindow LoginHook /Library/Scripts/mute-off.sh

chmod u+x $HOME/dotfiles/bin/reattach-to-user-namespace

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

brew install tmux

mkdir -p $HOME/.vim/bundle
git clone http://github.com/Shougo/neobundle.vim ~/.vim/neobundle.vim
