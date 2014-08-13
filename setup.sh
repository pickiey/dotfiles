#!/bin/bash

DOT_FILES=(.zshrc .vimrc .tmux.conf)

for file in ${DOT_FILES[@]}
do
  ln -sf $HOME/dotfiles/$file $HOME/$file
done

UTIL_FILES=( getCpuUsage.sh getMemUsage.sh tmuxx.sh)

for file in ${UTIL_FILES[@]}
do
  chmod u+x $HOME/dotfiles/bin/$file
done





if [ `uname` = "Darwin" ]; then
  # OS X

  # disable filename localize
  sudo mv /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/SystemFolderLocalizations.strings /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/SystemFolderLocalizations.strings.disable && sudo cp /System/Library/CoreServices/SystemFolderLocalizations/en.lproj/SystemFolderLocalizations.strings /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/

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

  # for copy&paste
  chmod u+x $HOME/dotfiles/bin/reattach-to-user-namespace

  # install Fonts
  #cp MyFontFile-Powerline.otf ~/Library/Fonts

  # install homebrew
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

elif [ `uname` = "Linux" ]; then
  # Linux
fi




mkdir -p $HOME/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/neobundle.vim
git clone https://github.com/erikw/tmux-powerline.git $HOME/.tmux/tmux-powerline

# neovim
ln -sf $HOME/dotfiles/.vimrc $HOME/.nvimrc
ln -sf $HOME/.vim $HOME/.nvim

# tmux-powerline
cp $HOME/dotfiles/bin/default.sh $HOME/.tmux/tmux-powerline/themes/default.sh
chmod u+x $HOME/.tmux/tmux-powerline/themes/default.sh
