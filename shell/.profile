# .profile

# Append to PATH
[ -d ~/.local/bin ] && PATH=~/.local/bin:"$PATH"
[ -d ~/.scripts ] && PATH=~/.scripts:"$PATH"
export PATH

export VISUAL=vim
export EDITOR=vim
export PAGER=less
export BROWSER=lynx

# XDG base directories
export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

if [ -f ~/.config/user-dirs.dirs ]; then
	. ~/.config/user-dirs.dirs
	export XDG_DESKTOP_DIR
	export XDG_DOWNLOAD_DIR
	export XDG_TEMPLATES_DIR
	export XDG_DOCUMENTS_DIR
	export XDG_MUSIC_DIR
	export XDG_PICTURES_DIR
	export XDG_VIDEOS_DIR
	export XDG_PUBLICSHARE_DIR
fi

# Directory for user-defined runit services
export SVDIR="$XDG_CONFIG_HOME"/runit/service

# Declutter home directory
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PYTHON_HISTORY="$XDG_STATE_HOME"/python_history # >=3.13.0a3
export SQLITE_HISTORY="$XDG_STATE_HOME"/sqlite_history

# Use Mesa (rusticl) for OpenCL
export RUSTICL_ENABLE=radeonsi

# Uncomment to force stricter POSIX compliance
export POSIXLY_CORRECT=y
export VIM_POSIX=y
export PS_PERSONALITY=posix
export LC_COLLATE=C

# Uncomment to disable colors in terminal programs that support this variable
#export NO_COLOR=y

# Limit the output width of the man(1) command
export MANWIDTH=80

case $SHELL in
	*/bash)
		# Set the init file for interactive shells (posix mode)
		[ -z "$POSIXLY_CORRECT" ] || export ENV=~/.bashrc

		# Extra guard for when this file gets sourced, for example by a
		# display manager, like lightdm(1), while the Xsession script is
		# written in sh(1).
		if [ -n "$BASH_VERSION" ]; then
			[ -f ~/.bashrc ] && . ~/.bashrc
		fi

		;;
	*/sh|*/dash)
		[ -f ~/.aliasrc ] && . ~/.aliasrc # TODO
		;;
esac
