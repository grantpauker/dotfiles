NEWPATH="$HOME/go/bin:$HBINPATH:$HOME/projects/bash/pushbullet:$HOME/.cargo/bin:/opt/devkitpro/devkitARM/bin:$HOME/.bin"
if [[ $PATH != *"$NEWPATH"* ]]; then
  export PATH="$PATH:$NEWPATH"
fi

export ZSH=/home/god/.oh-my-zsh
export ZSH_THEME="agnoster"


plugins=(
  git
	sudo
	go
)

source $ZSH/oh-my-zsh.sh
source ~/.aliases

bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word
full-clear(){
	zle kill-whole-line
	fclear
	zle reset-prompt
}
zle -N full-clear 
bindkey '^L' full-clear

zstyle ':completion:*:functions' ignored-patterns '_*'
setopt extendedglob
alias h='history'
export EDITOR=vim
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM


