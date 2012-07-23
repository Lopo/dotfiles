# set default editor
export EDITOR="vim"

# use own theme(s)
export ZSH_THEME="$HOME/.omz"

export PATH="$PATH:$HOME/bin:$(ruby -rubygems -e "puts Gem.user_dir")/bin"

autoload -U compinit promptinit
compinit; promptinit

autoload omz
zstyle :omz:style theme ebi
# load plugins
plugins=(colorizer git notfound)
omz init

alias \
    composer="php $HOME/bin/composer.phar" \
    df="df -Th --total"

