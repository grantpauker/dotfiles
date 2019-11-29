# oh-my-zsh config variables
export ZSH=/usr/share/oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/zsh-custom
export ZSH_THEME="minimal"

# oh-my-zsh plugins
plugins=(
	sudo
)

# setup oh-my-zsh
source $ZSH/oh-my-zsh.sh

# source custom aliases, functions, and keybindings
source $ZDOTDIR/aliases
source $ZDOTDIR/functions
source $ZDOTDIR/keybindings

# fix completion
zstyle ':completion:*' rehash true

# various zsh options
setopt extendedglob
setopt HIST_IGNORE_ALL_DUPS

# reload completions
autoload -Uz compinit && compinit

# add color to less manpageg
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# default options
export FZF_DEFAULT_OPTS='--color 16'
