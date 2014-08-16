# The setup script (setup.sh) is for OSX at present

## 1. At first
if you use OS X (require xcode)
``` sh
xcode-select --install
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
brew update
brew upgrade
brew install git
git clone https://github.com/pickiey/dotfiles.git $HOME/dotfiles
```

if you use Ubuntu (require git)
``` sh
ruby -e "$(wget -O- https://raw.github.com/Homebrew/linuxbrew/go/install)"
brew update
brew upgrade
git clone https://github.com/pickiey/dotfiles.git $HOME/dotfiles
```

## 2. Prepare for something beforehand
Link some dotfiles, change shell, install some packages, and so on...
``` sh
chmod u+x $HOME/dotfiles/setup.sh
$HOME/dotfiles/setup.sh
```

## 3. Configure the system
``` sh
chmod u+x $HOME/dotfiles/setup_util.sh
$HOME/dotfiles/setup_util.sh
```
