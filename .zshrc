# Basic configuration
[ -f ~/dotfiles/.zshrc.basic ] && source ~/dotfiles/.zshrc.basic



# Configureraton for each OS
case "${OSTYPE}" in
# MacOSX
darwin*)
  [ -f ~/dotfiles/.zshrc.osx ] && source ~/dotfiles/.zshrc.osx
  ;;
# Linux
linux*)
  [ -f ~/dotfiles/.zshrc.linux ] && source ~/dotfiles/.zshrc.linux
  ;;
esac



# Configureraton for local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
