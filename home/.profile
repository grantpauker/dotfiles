# system paths and directories
export PATH="$HOME/.local/share/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH"
export PKG_CONFIG_PATH=$PKG_CONFIG_SEARCH_PATH:/usr/local/lib/pkgconfig
export XDG_CONFIG_HOME=$HOME/.config
export ZDOTDIR="$HOME/.config/zsh"
export DOTFILES="$HOME/builds/dotfiles"

# default apps
export EDITOR=nvim
export TERMINAL=alacritty
export BROWSER=google-chrome-stable
export OPENER=fig

# hidpi support
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_SCREEN_SCALE_FACTORS=2
export LIBGL_DRI3_DISABLE=1

# setup various environment directories
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export CARGO_HOME=$HOME/.local/share/cargo
export PYLINTHOME=$HOME/.local/share/pylint.d

# default app options
export LPDEST=Brother

# setup mod key
xmodmap -e "clear mod4"
xmodmap -e "add Mod4 = Super_L"
xhost +

