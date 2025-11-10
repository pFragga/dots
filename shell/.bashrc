# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Watch YouTube videos through mpv(1)
mpvyt() { mpv --ytdl --ytdl-format=worst --no-terminal "$1"; }

# Extract the audio in good quality from a YouTube video
yta() { yt-dlp --ignore-errors --extract-audio --format bestaudio/best "$1"; }

# Move to a temporary directory
tempdir() { cd "$(mktemp -d)"; }

[ -f ~/.aliasrc ] && . ~/.aliasrc

eval "$(grep ^ANSI_COLOR /etc/os-release)"
PROMPT_COL="\e[${ANSI_COLOR:-0}m"
PROMPT_RES="\e[0m"
if [ -r ~/.local/lib/git-prompt.sh ]; then
	. ~/.local/lib/git-prompt.sh

	GIT_PS1_SHOWDIRTYSTATE=y
	GIT_PS1_SHOWUNTRACKEDFILES=y
	GIT_PS1_STATESEPARATOR='|'
	GIT_PS1_SHOWCOLORHINTS=y

	# For a slightly faster prompt, use PROMPT_COMMAND, instead of PS1
	PROMPT_COMMAND='__git_ps1 "\[$PROMPT_COL\][\u@\h \w\[$PROMPT_RES\]" "\[$PROMPT_COL\]]\\$\[$PROMPT_RES\] "'
else
	PS1='\[$PROMPT_COL\][\u@\h \w]\$\[$PROMPT_RES\] '
fi
CDPATH=~/Documents
PROMPT_DIRTRIM=2

HISTIGNORE=fg:bg:jobs
HISTCONTROL="erasedups:ignorespace"
HISTFILE="${XDG_STATE_HOME:-~/.local/state}"/bash_history
HISTSIZE=1500
HISTFILESIZE=3000

shopt -s autocd
shopt -s cdspell
shopt -s histappend

stty -ixon

# Fancy colors for ls(1)
if [ -z "$LS_COLORS" ] && command -v dircolors > /dev/null; then
	if [ -f ~/.dir_colors ]; then
		eval "$(dircolors -b ~/.dir_colors)"
	else
		eval "$(dircolors -b)"
	fi
fi
