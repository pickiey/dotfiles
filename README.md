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
chmod u+x $HOME/dotfiles/setup_util.sh

$HOME/dotfiles/setup.sh
$HOME/dotfiles/setup_util.sh
```



CentOS 7 (require git)
-------------------------------

```sh
sudo yum groupinstall 'Development Tools' && sudo yum install curl git m4 ruby texinfo bzip2-devel curl-devel expat-devel ncurses-devel zlib-devel

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"

brew update
brew upgrade

git clone https://github.com/pickiey/dotfiles.git $HOME/dotfiles

chmod u+x $HOME/dotfiles/setup.sh
chmod u+x $HOME/dotfiles/setup_util.sh

$HOME/dotfiles/setup.sh
$HOME/dotfiles/setup_util.sh
```



References
----------

- [Homebrew](http://brew.sh/index_ja.html)
- [Linuxbrew](https://github.com/Homebrew/linuxbrew)
