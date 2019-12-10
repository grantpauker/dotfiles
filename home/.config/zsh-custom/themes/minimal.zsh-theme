# Directory utils
# Max depth of of current dirrectory to show, at least 1
MAX_DIR_DEPTH=3

getdir(){
  echo ${PWD/#$HOME/'~'}
}

dirdepth(){
  getdir | grep -o / | wc -l
}

cutdir(){
  [[ "$PWD" == "$HOME" ]] || [[ "$PWD" == "/" ]] && return
  d=$(($(dirdepth)-$1-1))
  getdir | sed "s/^~*\(\/[^\/]*\)\{$d\}\///g"
}

dirprefix(){
  getdir | sed 's/\(.[\/]*\).*/\1/g'
}

formatdir(){
  [[ $(dirdepth) -le $1 ]] && getdir && exit
  printf "$(dirprefix)…$(cutdir $(($1-1)))"
}

# Reset the prompt, closing any open segments
prompt_reset() {
    echo -n "%{%f%b%k%}"
}

# Git: branch/detached head, dirty status
prompt_git() {
	(( $+commands[git] )) || return
	local PL_BRANCH_CHAR
	() {
			local LC_ALL="" LC_CTYPE="en_US.UTF-8"
			PL_BRANCH_CHAR=""
	}
	local ref dirty mode repo_path
	repo_path=$(git rev-parse --git-dir 2>/dev/null)
	
	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		dirty=$(parse_git_dirty)
		ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
		[[ -n $dirty ]] && color="yellow" || color="green"
		echo -n " %F{$color}("
		
		if [[ -e "${repo_path}/BISECT_LOG" ]]; then
			mode=" <B>"
		elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
			mode=" >M<"
		elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
			mode=" >R>"
		fi
	
		setopt promptsubst
		autoload -Uz vcs_info
			
		zstyle ':vcs_info:*' enable git
		zstyle ':vcs_info:*' get-revision true
		zstyle ':vcs_info:*' check-for-changes true
		zstyle ':vcs_info:*' stagedstr '✚'
		zstyle ':vcs_info:*' unstagedstr '●'
		zstyle ':vcs_info:*' formats ' %u%c'
		zstyle ':vcs_info:*' actionformats ' %u%c'
		vcs_info
		echo -n "${ref/refs\/heads\//$PL_BRANCH_CHAR }${vcs_info_msg_0_%% }${mode})"
	fi
}

prompt_virtualenv() {
	[[ "$VIRTUAL_ENV" == "" ]] && return
	name="$(basename $VIRTUAL_ENV)"
	echo -n " %F{yellow}($name)"
}


# Dir: current working directory
prompt_dir() {
	[[ -L $PWD ]] && color="cyan" || color="blue" # change color if folder is a symlink
	echo -n " %F{$color}$(formatdir $MAX_DIR_DEPTH)%f"
}

# Status:
# - was there an error
# - am I root
# - are there background jobs
prompt_status() {
	local symbols
	main="❱"
	su="❰"
	bg="◌"
	
	[[ $RETVAL -ne 0 ]] && color="red" || color="green"
	[[ $UID -eq 0 ]] && symbols="$su" || symbols="$main"
	[[ $(jobs -l | wc -l) -gt 0 ]] && symbols="$bg$symbols"
	
	symbols="%{%F{$color}%}$symbols"
	echo -n "$symbols"	
}

# Time: current time
prompt_time() {
	echo -n "%D{%l:%M:%S}" 
}

## Main prompt
build_prompt() {
	RETVAL=$?
	prompt_reset
	prompt_status
	prompt_dir
	prompt_git
  prompt_virtualenv
	prompt_reset
}

## Right prompt
build_rprompt() {
	prompt_reset
	prompt_time
	prompt_reset
}

PROMPT='$(build_prompt) '
#RPROMPT='$(build_rprompt)'
