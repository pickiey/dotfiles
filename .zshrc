# Basic configuration
[ -f $HOME/dotfiles/.zshrc.basic ] && source $HOME/dotfiles/.zshrc.basic



# Configureraton for each OS
case "${OSTYPE}" in
# MacOSX
darwin*)
  [ -f $HOME/dotfiles/.zshrc.osx ] && source $HOME/dotfiles/.zshrc.osx
  ;;
# Linux
linux*)
[ -f $HOME/dotfiles/.zshrc.ubuntu ] && source $HOME/dotfiles/.zshrc.ubuntu
  ;;
esac



# Configuration for plugins
[ -f $HOME/dotfiles/.zshrc.plugins_setting ] && source $HOME/dotfiles/.zshrc.plugins_setting



# Configureraton for local
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
