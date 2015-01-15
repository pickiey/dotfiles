Synopsis
========

The setup script (setup.sh) is for OSX at present.

OS X Yosemite (require xcode)
-------------------------------

```sh
sudo xcrun cc
xcode-select --install

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

git clone https://github.com/pickiey/dotfiles.git $HOME/dotfiles

chmod u+x $HOME/dotfiles/setup.sh

$HOME/dotfiles/setup.sh
$HOME/dotfiles/setup_util.sh
```



Ubuntu 11.10 (require xcode)
-------------------------------

```sh
sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

brew update
brew upgrade

git clone https://github.com/pickiey/dotfiles.git $HOME/dotfiles

chmod u+x $HOME/dotfiles/setup.sh

$HOME/dotfiles/setup.sh
$HOME/dotfiles/setup_util.sh
```



References
----------

- [Homebrew](http://brew.sh/index_ja.html)
- [Linuxbrew](https://github.com/Homebrew/linuxbrew)
