#!/bin/bash

# Request brew
echo "Requesting brew... "

if [ ! `which brew` ]; then
  echo "ERROR: This script requires brew to run"
  exit
fi





# ==============================================================================
# Set variabbles
# ==============================================================================

PACKAGES_OSX=(
git
go
lua
homebrew/dupes/grep
reattach-to-user-namespace
tmux
tor
tree
unrar
w3m
wget
z
zsh)

PACKAGES_OSX_CASK=(
boot2docker
dropbox
evernote
iterm2
karabiner
mactex
ghc
google-chrome
google-japanese-ime
qlmarkdown
slate
smoothmouse
vagrant
virtualbox
xtrafinder)

PACKAGES_UBUNTU=(
docker.io
git
ghc
ibus-mozc
nautilus-open-terminal
tmux
tree
unrar
unity-tweak-tool
vagrant
vim-gnome
virtualbox
w3m
wget
xclip
zsh)





# ==============================================================================
# Prepare for something beforehand
# ==============================================================================

# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade





# ==============================================================================
# for OS X
# ==============================================================================

if [ `uname` == "Darwin" ]; then
  # OS X

  # Add Repository
  brew tap homebrew/binary
  brew tap caskroom/cask
  brew tap homebrew/dupes

  for file in ${PACKAGES_OSX[@]}
  do
    brew install $file
  done

  brew install brew-cask

  for file in ${PACKAGES_OSX_CASK[@]}
  do
    brew cask install $file
  done



  # Remove outdated versions
  brew cleanup
  brew cask cleanup

fi





# ==============================================================================
# Show exit message
# ==============================================================================

echo ""
echo "All actions completed successfully. Exiting script now."

exit
