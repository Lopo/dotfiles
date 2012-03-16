# use own theme(s)
export ZSH_THEME="$HOME/.omz"

autoload -U compinit
compinit

autoload omz
zstyle :omz:style theme ebi
# load plugins
plugins=(colorizer git notfound)
omz init

# set default editor
export EDITOR="vim"
