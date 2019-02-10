#!/bin/bash

# Request brew
echo "Requesting brew..."

if [ ! `which brew` ]; then
  echo "ERROR: This script requires brew to run"
  exit
fi





# ==============================================================================
# Renewal
# ==============================================================================

echo ""

brew upgrade

if [ `uname` == "Darwin" ]; then
  brew cask upgrade
fi




# ==============================================================================
# Read Brew_pkg_list
# ==============================================================================

if [ -e $HOME/dotfiles/Brew_pkg_list ]; then

  source $HOME/dotfiles/Brew_pkg_list

  # ============================================================================
  # Mac
  # ============================================================================

  if [ `uname` == "Darwin" ]; then

    BREWHOME=/usr/local/Homebrew

    echo ""

    for file in ${PACKAGES_MAC[@]}
    do
      brew install $file
    done

    echo ""

    for file in ${PACKAGES_MAC_CASK[@]}
    do
      brew cask install $file
    done

  fi

  # ============================================================================
  # Linux
  # ============================================================================

  if [ `uname` == "Linux" ]; then

    echo ""

    for file in ${PACKAGES_LINUX[@]}
    do
      brew install $file
    done

  fi

fi





# ==============================================================================
# Remove outdated versions
# ==============================================================================

echo ""

brew cleanup





# ==============================================================================
# Show exit message
# ==============================================================================

echo ""
echo "All actions completed successfully. Exiting script now."

exit
