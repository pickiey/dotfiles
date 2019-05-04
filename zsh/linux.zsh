# ==============================================================================
# PATH configuration
# ==============================================================================

# linuxbrew
BREWHOME=$HOME/.linuxbrew
path=($BREWHOME/*/bin(N-/) $path)
MANPATH=($BREWHOME/share/man(N-/) $path)
INFOPATH=($BREWHOME/share/info(N-/) $path)
LD_LIBRARY_PATH=($BREWHOME/lib(N-) $LD_LIBRARY_PATH)





# ==============================================================================
# Alias configuration
# ==============================================================================

# ls
alias ls="ls --color"

# clipboard
alias pbcopy="xsel --clipboard --input"
alias pbc=pbcopy
alias pbpaste="xsel --clipboard --output"
alias pbp=pbpaste
