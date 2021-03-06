# ==============================================================================
# Environment variable configuration
# ==============================================================================

# LANG
LANG=en_US.UTF-8
case "$UID" in
0)
    LANG=C
    ;;
esac

# set editor
EDITOR='vim'

# auto change directory
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound when complete list displayed
setopt nolistbeep

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# グロブ機能を拡張する
setopt extended_glob

# ファイルグロブで大文字小文字を区別しない
unsetopt caseglob

# 標準出力で上書きできなくする
# 上書きするときは>でなくて>!
# ファイルが存在しないとき>>でなくて>>!
setopt noclobber

# ターミナルのタイトルをuser@hostname:current-directoryに変更する
case "$TERM" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# パスの重複回避
typeset -U path PATH

# PATHをbinと名のつくもの全てに
#    パス(...): ...という条件にマッチするパスのみ残す。
#        (N-/): 存在しないディレクトリは登録しない。
#            N: NULL_GLOBオプションを設定。
#               globがマッチしなかったり存在しないパスを無視する。
#            -: シンボリックリンク先のパスを評価。
#            /: ディレクトリのみ残す。
path=($HOME/bin(N-/) $path)
path=($HOME/*/bin(N-/) $path)

# Prediction configuration
#autoload predict-on



# Completion configuration
fpath=($HOME/.zsh/functions/Completion $fpath)
autoload -U compinit
compinit -u





# ==============================================================================
# Keybind configuration
# ==============================================================================

# vim like keybind
bindkey -v

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
bindkey "\e[Z" reverse-menu-complete


# Command history configuration
HISTFILE=$HOME/.cashe/zsh/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data





# ==============================================================================
# Alias configuration
# ==============================================================================

# expand aliases before completing
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"

# jでjobs表示
#   zと被ってるから無効に
#alias j="jobs -l"

alias v=$EDITOR
alias vim=$EDITOR

alias la="ls -a"
alias lsa="ls -a"
alias lf="ls -F"
alias ll="ls -lh"
alias lla="ls -alh"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias cdt="cd $HOME/.dotfiles"
alias cdd="cd $HOME/Downloads"
alias cdoc="cd $HOME/Documents"
alias cdcd="cd $HOME/Documents/code"

#function cdm(){
#    local p
#    local y
#    local m
#    local d
#    p="$HOME/Dropbox/paper"
#    y="`date +%Y`"
#    m="`date +%m`"
#    d="`date +%d_%a`"
#    if [ ! -f $p/$y/$m/$d ];then
#        mkdir -p $p/$y/$m/$d
#    fi
#    cd $p/$y/$m/$d
#}
#
#function mm(){
#    local p
#    local y
#    local m
#    local d
#    p="$HOME/Dropbox/paper"
#    y="`date +%Y`"
#    m="`date +%m`"
#    d="`date +%d_%a`"
#    if [ ! -d $p/$y/$m/$d ];then
#        mkdir -p $p/$y/$m/$d
#    fi
#    $EDITOR $p/$y/$m/$d/memo.md
#}

alias aa=exit
alias ZZ=exit
alias ZQ=exit

# 右プロンプトでメモ
#function memo(){ RPROMPT="%{$fg[red]%}$1%{$reset_color%}" }

# Weblioで単語の用例検索
#function dic(){ w3m "https://ejje.weblio.jp/content/$1" | grep "用例" }

# カレントパス以下のディレクトリでGrepマッチしたディレクトリに移動
function jj(){
    if [ $1 ]; then
        JUMPDIR=$(find . -type d -maxdepth 1 | grep $1 | tail -1)
        if [[ -d "$JUMPDIR" && -n "$JUMPDIR" ]]; then
            cd $JUMPDIR
        else
        echo "directory not found"
        fi
    fi
}

# カレントディレクトリ以下にある空ディレクトリを削除
function cleanup(){
    find . -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
}





# ==============================================================================
# terminal configuration
# ==============================================================================

# enable color output
autoload -U colors; colors

# terminal color configuration

case "$TERM" in
xterm|xterm-color)
    LSCOLORS=exfxcxdxbxegedabagacad
    LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    LSCOLORS=exfxcxdxbxegedabagacad
    LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    LSCOLORS=ExFxCxdxBxegedabagacad
    LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    LSCOLORS=gxFxCxdxBxegedabagacad
    LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# Zshをもっとかわいくする{{{

    # もしかして機能
    setopt correct
    # PCRE 互換の正規表現を使う
    setopt re_match_pcre
    # プロンプトが表示されるたびにプロンプト文字列を評価、置換する
    setopt prompt_subst
    # VCSの情報を取得するzshの便利関数 vcs_infoを使う
    autoload -Uz vcs_info
    # 表示フォーマットの指定
    # %b ブランチ情報
    # %a アクション名(mergeなど)
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
    zstyle ':vcs_info:git:*' unstagedstr "-"
    zstyle ':vcs_info:*' formats '[%s %b%c%u]'
    zstyle ':vcs_info:*' actionformats '[%s %b %a%c%u]'
    precmd(){
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }

    # PROMPT  -> プロンプト指定
    # PROMPT2 -> プロンプト指定(コマンドの続き)
    # SPROMPT -> もしかして時のプロンプト指定
    PROMPT=$'\n'"%{$fg[cyan]%}[%n@%m %D{%m/%d %T}] %1(v|%F{magenta}%1v%f|) %{$fg[yellow]%}%~%{$reset_color%}"$'\n'"%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%) <)%{$reset_color%} "
    PROMPT2="[%n]> "
    SPROMPT="%{$suggest%}(*'~'%)? < もしかして %{$fg[red]%}%B%r%b%{$reset_color%} かな? [そう!(y), 違う!(n),a,e] : "

    # はちゅねミクVersion
    #PROMPT=$'\n'"%{$fg[cyan]%}[%n@%m %D{%m/%d %T}] %1(v|%F{magenta}%1v%f|) %{$fg[yellow]%}%~%{$reset_color%}"$'\n'"%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(@ ﾟ □ ﾟ) <!(@￣￢￣%) <)%{$reset_color%} "
    #PROMPT2="[%n]> "
    #SPROMPT="%{$suggest%}%{$fg[red]%}(@ ﾟ △ ﾟ%) <%{$reset_color%} もしかして %{$fg[red]%}%B%r%b%{$reset_color%} かな? [そう!(y), 違う!(n),a,e] : "

    # 時刻更新
    TRAPALRM(){ zle reset-prompt }
    TMOUT=1

# }}}

# 右プロンプト
#   バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
#RPROMPT="%1(v|%F{green}%1v%f|)"
