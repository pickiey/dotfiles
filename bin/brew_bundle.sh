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

brew update
brew upgrade





# ==============================================================================
# Read Brew_pkg_list
# ==============================================================================

if [ -e $HOME/dotfiles/Brew_pkg_list ]; then

  source $HOME/dotfiles/Brew_pkg_list

  # ============================================================================
  # OS X
  # ============================================================================

  if [ `uname` == "Darwin" ]; then

    echo ""

    # Add Repository
    brew tap caskroom/cask

    echo ""

    for file in ${PACKAGES_CUI_OSX[@]}
    do
      brew install $file
    done

    echo ""

    brew install brew-cask

    echo ""

    for file in ${PACKAGES_GUI_OSX[@]}
    do
      brew cask install $file
    done

  fi

  # ============================================================================
  # Ubuntu
  # ============================================================================

  if [ `uname` == "Linux" ]; then

    echo ""

    for file in ${PACKAGES_CUI_UBUNTU[@]}
    do
      brew install $file
    done

    echo ""

    for file in ${PACKAGES_GUI_UBUNTU[@]}
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
brew cask cleanup





# ==============================================================================
# Show exit message
# ==============================================================================

echo ""
echo "All actions completed successfully. Exiting script now."

exit
