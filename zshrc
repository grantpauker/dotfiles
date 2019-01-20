export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="minimal"
export ZSH_CUSTOM=$HOME/.config/zsh-custom

plugins=(
	sudo
	go
	command-not-found
	fzf-zsh
	dircycle
	extract
	zsh-syntax-highlighting
)

fpath=(~/.zsh/completion $fpath)
source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.functions

bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word
full-clear(){ zle kill-whole-line; fclear; zle reset-prompt; }
zle -N full-clear 
bindkey '^L' full-clear
alias resource='source ~/.zshrc'
resource-widget(){ zle kill-whole-line; resource; zle reset-prompt; }
zle -N resource-widget 
bindkey '^K' resource-widget

zstyle ':completion:*:functions' ignored-patterns '_*'
setopt extendedglob
setopt HIST_IGNORE_ALL_DUPS

export PKG_CONFIG_PATH=$PKG_CONFIG_SEARCH_PATH:/usr/local/lib/pkgconfig

zstyle ':completion:*' rehash true
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
export PSEARCH_DIR=~/projects
export FZF_DEFAULT_OPTS='--color 16'

autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
export VIRTUAL_ENV_DISABLE_PROMPT=1
