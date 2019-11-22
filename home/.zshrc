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
source ~/.aliases
source ~/.functions
source ~/.keybindings

# fix completion???
#zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' rehash true

# various zsh options
setopt extendedglob
setopt HIST_IGNORE_ALL_DUPS

# reload completions
autoload -Uz compinit && compinit
