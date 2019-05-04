# ------------------------------------------------
# ag
# ------------------------------------------------

[ -x `which rg` ] && alias grep="rg -uu"





# ------------------------------------------------
# htop
# ------------------------------------------------

[ -x `which htop` ] && alias top=htop





# ------------------------------------------------
# tmux
# ------------------------------------------------

alias tm="$HOME/.dotfiles/bin/tmuxx.sh"
alias tma="tmux attach"
alias tmd="tmux detach"
alias tml="tmux list-window"
alias tmk="tmux kill-server"

# tmux-powerline
PROMPT+='$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'





# ------------------------------------------------
# vagrant
# ------------------------------------------------

alias vg=vagrant





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
