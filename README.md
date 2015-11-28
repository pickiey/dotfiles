# 内容

dotfilesで端末設定一括でやるスクリプトとその設定

--------------------------------------------------------------------------------

## OS X Yosemite (xcode必要)

### 使い方

```sh
sudo xcrun cc
xcode-select --install

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

git clone https://github.com/pickiey/dotfiles.git $HOME/dotfiles

chmod u+x $HOME/dotfiles/bin/setup_osx.sh

$HOME/dotfiles/bin/setup_osx.sh
```

### フォントの追加

```sh
cp path/to/MyFontFile-Powerline.otf $HOME/Library/Fonts
```

--------------------------------------------------------------------------------

## Ubuntu 14.10

### 使い方

```sh
sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"

brew update
brew upgrade

git clone https://github.com/pickiey/dotfiles.git $HOME/dotfiles

chmod u+x $HOME/dotfiles/bin/setup_ubuntu.sh

$HOME/dotfiles/bin/setup_ubuntu.sh
```

### フォントの追加

```sh
mkdir -p ~/.fonts
cp path/to/MyFontFile-Powerline.otf $HOME/.fonts
```

--------------------------------------------------------------------------------

## 参考

- [Homebrew](http://brew.sh)
- [Linuxbrew](http://brew.sh/linuxbrew/)
