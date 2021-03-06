# ==============================================================================
# PATH configuration
# ==============================================================================

# homebrew
BREWHOME=/usr/local
path=($BREWHOME/bin(N-/) $path)
path=($BREWHOME/sbin(N-/) $path)
alias bb="brew upgrade"

# docker
alias dl="docker ps -l -q"

# ruby
# ruby 本体はOS付随
alias rb=ruby

# haskell
#STACKPATH=$HOME/.stack/programs/x86_64-osx/ghc-8.6.4
#path=($STACKPATH/bin $path)
#alias hs="stack runghc"

# go
GOPATH=$HOME/.go
path=($GOPATH/bin $path)

# python
# python3 本体はOS付随
# パッケージ管理は pip3
PIPPATH=$HOME/Library/Python/3.8
path=($PIPPATH/bin $path)
LC_ALL=ja_JP.UTF-8
alias python=python3
alias py=python3
alias pip=pip3




# ==============================================================================
# Alias configuration
# ==============================================================================

# ls
alias ls="ls -G -w"

# clipboard
alias pbc=pbcopy
alias pbp=pbpaste

# open current directory of terminal with finder
alias f="open ."

# open current directory of finder with terminal
function cdf(){
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"
        pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# QuickLook
alias ql='qlmanage -p "$@" >& /dev/null'

# show size of picture
alias imgsize="mdls -name kMDItemPixelWidth -name kMDItemPixelHeight"

# delete .DS_Store in current directory
alias delmacfile="find . -name \".DS_Store\" -exec rm -f {} \;"

# toggle wifi on/off
function wifi(){
    if networksetup -getairportnetwork en0 | grep off; then
        echo on
        networksetup -setairportpower en0 on
    else
        echo off
        networksetup -setairportpower en0 off
    fi
}
