#!/bin/bash

DOT_FILES=(.zshrc .vimrc .tmux.conf)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

mkdir -p $HOME/.vim/bundle
git clone http://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
