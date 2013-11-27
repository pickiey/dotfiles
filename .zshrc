# Customize to your needs...
[ -f ~/dotfiles/.zshrc.otoko ] && source ~/dotfiles/.zshrc.otoko
[ -f ~/dotfiles/.zshrc.custom ] && source ~/dotfiles/.zshrc.custom

## alias設定
[ -f ~/dotfiles/.zshrc.alias ] && source ~/dotfiles/.zshrc.alias

case "${OSTYPE}" in
# MacOSX
darwin*)
  # ここに設定
  [ -f ~/dotfiles/.zshrc.osx ] && source ~/dotfiles/.zshrc.osx
  ;;
# Linux
linux*)
  # ここに設定
  [ -f ~/dotfiles/.zshrc.linux ] && source ~/dotfiles/.zshrc.linux
  ;;
esac

## local固有設定
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
