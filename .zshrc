# XDG Base Directory Specification
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache
XDG_DATA_HOME=~/.local/share

XDG_CONFIG_DIRS=/etc/xdg
XDG_DATA_DIRS=/usr/local/share/:/usr/share/




zshrc=$HOME/dotfiles/.zshrc



# Basic configuration
dotfile=$zshrc.basic
[ -f $dotfile ] && source $dotfile



# Configureraton for each OS
case $OSTYPE in
# Mac
darwin*)
    dotfile=$zshrc.mac
    ;;
# Linux
linux*)
    dotfile=$zshrc.linux
    ;;
esac
[ -f $dotfile ] && source $dotfile



# Configuration for plugins
dotfile=$zshrc.plugins_setting
[ -f $dotfile ] && source $dotfile



# Configureraton for local
dotfile=$zshrc.local
[ -f $dotfile ] && source $dotfile



unset dotfile
unset zshrc
