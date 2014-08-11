#!/bin/bash

# disable filename localize
sudo mv /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/SystemFolderLocalizations.strings /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/SystemFolderLocalizations.strings.disable && sudo cp /System/Library/CoreServices/SystemFolderLocalizations/en.lproj/SystemFolderLocalizations.strings /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj/

# on mouseover, focus window
defaults write com.apple.Terminal FocusFollowsMouse -boolean true
#defaults delete com.apple.Terminal FocusFollowsMouse


# in QuickLook, enable text selection
defaults write com.apple.Finder QLEnableTextSelection -bool YES
#defaults delete com.apple.Finder QLEnableTextSelection

# make silent on startup
MUTE_FILES=( mute-off.sh mute-on.sh)

for file in ${MUTE_FILES[@]}
do
  sudo cp $HOME/dotfiles/bin/$file /Library/Scripts/$file
  sudo chmod u+x /Library/Scripts/$file
done

sudo defaults write com.apple.loginwindow LogoutHook /Library/Scripts/mute-on.sh
sudo defaults write com.apple.loginwindow LoginHook /Library/Scripts/mute-off.sh

# change shell
chsh -s /bin/zsh
#sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"
#chsh -s /usr/local/bin/zsh

# for copy&paste
chmod u+x $HOME/dotfiles/bin/reattach-to-user-namespace

# install Fonts
#cp MyFontFile-Powerline.otf ~/Library/Fonts

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

# install some packages
#brew bundle

# for Karabiner
#mkdir -p $HOME/Library/Application\ Support/Karabiner && cp $HOME/dotfiles/private.xml $HOME/Library/Application\ Support/Karabiner/private.xml

# after install tor
#mkdir -p $HOME/Library/LaunchAgents && cp /usr/local/Cellar/tor/0.2.4.23/homebrew.mxcl.tor.plist $HOME/Library/LaunchAgents/ && launchctl load -w $HOME/Library/LaunchAgents/homebrew.mxcl.tor.plist

# not startup tor
#launchctl unload $HOME/Library/LaunchAgents/homebrew.mxcl.tor.plist && rm $HOME/Library/LaunchAgents/homebrew.mxcl.tor.plist



# Happy Hacking OSX!
# http://tukaikta.blog135.fc2.com/blog-entry-251.html

defaults write com.apple.finder AppleShowAllFiles -bool true
#defaults delete com.apple.finder AppleShowAllFiles

chflags nohidden ~/Library
#chflags hidden ~/Library

defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
#defaults delete com.apple.finder _FXShowPosixPathInTitle

defaults write com.apple.finder QLEnableTextSelection -bool true
#defaults delete com.apple.finder QLEnableTextSelection

defaults write com.apple.finder QLHidePanelOnDeactivate -bool true
#defaults delete com.apple.finder QLHidePanelOnDeactivate

defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
#defaults delete -g NSNavPanelExpandedStateForSaveMode

defaults write -g PMPrintingExpandedStateForPrint -bool true
#defaults delete -g PMPrintingExpandedStateForPrint

defaults write -g NSWindowResizeTime 0.1
#defaults delete -g NSWindowResizeTime

defaults write com.apple.finder AutoStopWhenSelectionChanges -bool false
#defaults delete com.apple.finder AutoStopWhenSelectionChanges

defaults write com.apple.finder AutoStopWhenScrollingOffBounds -bool false
#defaults delete com.apple.finder AutoStopWhenScrollingOffBounds

defaults write com.apple.finder QLInlinePreviewMinimumSupportedSize -int 0
#defaults delete com.apple.finder QLInlinePreviewMinimumSupportedSize

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
#defaults delete com.apple.desktopservices DSDontWriteNetworkStores

defaults write com.apple.CrashReporter DialogType none
#defaults delete com.apple.CrashReporter DialogType

defaults write com.apple.dock showhidden -bool true
#defaults delete com.apple.dock showhidden

defaults write com.apple.dock mouse-over-hilite-stack -bool true
#defaults delete com.apple.dock mouse-over-hilite-stack

defaults write com.apple.dashboard mcx-disabled -bool true
#defaults delete com.apple.dashboard mcx-disabled

defaults write com.apple.screencapture disable-shadow -bool true
#defaults delete com.apple.screencapture disable-shadow

defaults write com.apple.screencapture name Capture
#defaults delete com.apple.screencapture name

defaults write com.apple.screencapture location ~/Pictures
#defaults delete com.apple.screencapture location
