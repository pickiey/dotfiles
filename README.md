Synopsis
========

The setup script (setup.sh) is for OSX at present

If you use OS X (require xcode)
-------------------------------

``` sh
xcode-select --install
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
brew update
brew upgrade
brew install git
git clone https://github.com/pickiey/dotfiles.git $HOME/dotfiles
chmod u+x $HOME/dotfiles/setup.sh
chmod u+x $HOME/dotfiles/setup_util.sh
$HOME/dotfiles/setup.sh
$HOME/dotfiles/setup_util.sh
```



If you use Ubuntu (require git)
-------------------------------

``` sh
ruby -e "$(wget -O- https://raw.github.com/Homebrew/linuxbrew/go/install)"
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

- [Homebrew]
- [Linuxbrew]



[Homebrew]:http://http://brew.sh/
[Linuxbrew]:https://github.com/Homebrew/linuxbrew
