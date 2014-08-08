#!/bin/bash

DOT_FILES=(.zshrc .vimrc .tmux.conf)

for file in ${DOT_FILES[@]}
do
  touch $HOME/$file
  rm $HOME/$file
  ln -s $HOME/dotfiles/$file $HOME/$file
done

UTIL_FILES=( getCpuUsage.sh getMemUsage.sh tmuxx.sh)

for file in ${UTIL_FILES[@]}
do
  chmod u+x $HOME/dotfiles/bin/$file
done

mkdir -p $HOME/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/neobundle.vim
git clone https://github.com/erikw/tmux-powerline.git ~/.tmux/tmux-powerline

cp $HOME/dotfiles/bin/default.sh $HOME/.tmux/tmux-powerline/themes/default.sh
chmod u+x $HOME/.tmux/tmux-powerline/themes/default.sh
