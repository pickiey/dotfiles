#!/bin/bash

if [ `uname` = "Darwin" ]; then
  # OS X

  # Happy Hacking OSX!
  # http://tukaikta.blog135.fc2.com/blog-entry-251.html

  # on mouseover, focus window
  defaults write com.apple.Terminal FocusFollowsMouse -boolean true
  #defaults delete com.apple.Terminal FocusFollowsMouse

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

elif [ `uname` = "Linux" ]; then
  # Linux
fi
