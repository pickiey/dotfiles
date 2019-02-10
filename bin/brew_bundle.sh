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
