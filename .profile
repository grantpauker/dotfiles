# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi


NEWPATH="$HOME/go/bin:$HBINPATH:$HOME/projects/bash/pushbullet"
if [[ $PATH != *"$NEWPATH"* ]]; then
	export PATH="$PATH:$NEWPATH"
fi

export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export GDK_SCALE=2
export ELM_SCALE=0.5

export PATH="$HOME/.cargo/bin:$PATH"

xmodmap -e "clear mod4"
xmodmap -e "add Mod4 = Super_L"
export QT_SCREEN_SCALE_FACTORS=2
xhost +
