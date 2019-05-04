# 内容

dotfilesで端末設定一括でやるスクリプトとその設定

--------------------------------------------------------------------------------

## MacOS (xcode必要)

### 使い方

```sh
sudo xcrun cc
xcode-select --install

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update

git clone https://github.com/pickiey/dotfiles.git $HOME/.dotfiles

chmod u+x $HOME/.dotfiles/setup_script/setup_mac.sh

$HOME/.dotfiles/setup_script/setup_mac.sh
```

### フォントの追加

```sh
cp path/to/MyFontFile-Powerline.otf $HOME/Library/Fonts
```

--------------------------------------------------------------------------------

## 参考

- [Homebrew](https://brew.sh)
