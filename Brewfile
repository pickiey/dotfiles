#====================================
# 実行方法
# Brewfileのあるディレクトリで`brew bundle`
#====================================
# Make sure using latest Homebrew
update

# Update already-installed formula
upgrade

# Add Repository
tap homebrew/binary
tap caskroom/cask

tap homebrew/dupes


# Packages for development
install git
install homebrew/dupes/grep
install tmux
install tor
install tree
install unrar
install wget
install zsh

# Packages for brew-cask
install brew-cask

# .dmg from brew-cask
cask install bettertouchtool
cask install boot2docker
cask install iterm2
cask install karabiner
cask install macvim
cask install ghc
cask install google-chrome
cask install google-japanese-ime
cask install tinkertool
cask install vagrant
cask install virtualbox
cask install xtrafinder

# Remove outdated versions
cleanup
cask cleanup
