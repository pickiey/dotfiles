#!/bin/bash

# 日本語フォルダー名を英語表記にする
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

# ゲストセッションを無効化する
sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" >/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'
# 元に戻すときは
#sudo rm /usr/share/lightdm/lightdm.conf.d/50-no-guest.conf

# to install Fonts
#mkdir -p ~/.fonts
#cp MyFontFile-Powerline.otf ~/.fonts

# Packages for development
#sudo apt-get install chromium
sudo apt-get install docker.io
sudo apt-get install git
#sudo apt-get install ghc
#sudo apt-get install ibus-mozc
sudo apt-get install nautilus-open-terminal
sudo apt-get install tmux
sudo apt-get install tree
sudo apt-get install unrar
sudo apt-get install unity-tweak-tool
sudo apt-get install vagrant
sudo apt-get install vim-gnome
sudo apt-get install virtualbox
sudo apt-get install w3m
sudo apt-get install wget
sudo apt-get install zsh

# change shell
chsh -s /usr/bin/zsh
