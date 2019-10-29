export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="minimal"
export ZSH_CUSTOM=$HOME/.config/zsh-custom
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PKG_CONFIG_PATH=$PKG_CONFIG_SEARCH_PATH:/usr/local/lib/pkgconfig
export FZF_DEFAULT_OPTS='--color 16'

plugins=(
	sudo
	fzf-zsh
	dircycle
	fast-syntax-highlighting
)

fpath=(~/.zsh/completion $fpath)
source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.functions
alias resource='source ~/.zshrc'

bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word

full-clear(){ zle kill-whole-line; fclear; zle reset-prompt; }
zle -N full-clear 
bindkey '^L' full-clear

zstyle ':completion:*:functions' ignored-patterns '_*'
setopt extendedglob
setopt HIST_IGNORE_ALL_DUPS


zstyle ':completion:*' rehash true
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unsetopt BEEP


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
