# set default editor
export EDITOR="vim"

export PATH="$PATH:$HOME/bin:$(ruby -rubygems -e "puts Gem.user_dir")/bin"

# Path to your oh-my-zsh configuration
ZSH_CUSTOM=$HOME/.omz

# Set name of the theme to load
# Optionally, if you set this to "random", it'll load a random theme each time that oh-my-zsh is loaded
ZSH_THEME='ebi'

alias \
	composer="php $HOME/bin/composer.phar" \
	df="df -Th --total"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git notfound archlinux colored-man colorizer command-not-found composer encode64 extract screen themes powerpill)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
