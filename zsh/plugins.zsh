# ------------------------------------------------
# ag
# ------------------------------------------------

alias grep="rg -uu"





# ------------------------------------------------
# autoprefixer
# ------------------------------------------------

alias sl="stylus --use autoprefixer-stylus"

function ap(){
    if [ $2 ]; then
        npx postcss $1 --use autoprefixer -d $2
    else
        npx postcss $1 --use autoprefixer -d ./
    fi
}





# ------------------------------------------------
# htop
# ------------------------------------------------

alias top=htop





# ------------------------------------------------
# nvm
# ------------------------------------------------

#export NVM_DIR=$HOME/.nvm
#source $(brew --prefix nvm)/nvm.sh





# ------------------------------------------------
# tmux
# ------------------------------------------------

alias tm="$HOME/.dotfiles/tmux/bin/tmuxx.sh"
alias tma="tmux attach"
alias tmd="tmux detach"
alias tml="tmux list-window"
alias tmk="tmux kill-server"

# tmux-powerline
PROMPT+='$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# tmux-resurrect
# 初回シェル時のみ tmux実行
#if [ $SHLVL = 1 ]; then tm fi





# ------------------------------------------------
# http-server
# ------------------------------------------------

alias ws=http-server





# ------------------------------------------------
# pug
# ------------------------------------------------

alias pg="pug --pretty"





# ------------------------------------------------
# vagrant
# ------------------------------------------------

#alias vg=vagrant





# ------------------------------------------------
# nvim
# ------------------------------------------------

export EDITOR='nvim'

alias v=$EDITOR
alias vim=$EDITOR





# ------------------------------------------------
# z
# ------------------------------------------------

if [ -e $BREWHOME/etc/profile.d/z.sh ]; then
    _Z_CMD=j
    source $BREWHOME/etc/profile.d/z.sh
fi





# ------------------------------------------------
# zsh-completions
# ------------------------------------------------

fpath=($BREWHOME/share/zsh-completions $fpath)





# ------------------------------------------------
# zsh-syntax-highlighting
# ------------------------------------------------

ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$BREWHOME/share/zsh-syntax-highlighting/highlighter
