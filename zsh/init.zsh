# XDG Base Directory Specification
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache
XDG_DATA_HOME=~/.local/share

XDG_CONFIG_DIRS=/etc/xdg
XDG_DATA_DIRS=/usr/local/share/:/usr/share/




dir=$HOME/.dotfiles/zsh




# Basic configuration
file=$dir/base.zsh
[ -f $file ] && source $file



# Configureraton for each OS
case $OSTYPE in
# Mac
darwin*)
    file=$dir/mac.zsh
    ;;
# Linux
linux*)
    file=$dir/linux.zsh
    ;;
esac
[ -f $file ] && source $file



# Configuration for plugins
file=$dir/plugins.zsh
[ -f $file ] && source $file



# Configureraton for local
file=$dir/local.zsh
[ -f $file ] && source $file



unset file
unset dir
