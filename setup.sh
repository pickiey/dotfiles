#!/bin/bash

DOT_FILES=(.zshrc .vimrc .tmux.conf)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

chmod u+x $HOME/dotfiles/bin/tmuxx.sh

mkdir -p $HOME/.vim/bundle
git clone http://github.com/Shougo/neobundle.vim ~/.vim/neobundle.vim
