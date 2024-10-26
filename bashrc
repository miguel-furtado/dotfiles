# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

. "$HOME/.shellcommon/exports"
. "$HOME/.shellcommon/aliases"
. "$HOME/.shellcommon/env"


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignorespace:erasedups
# append to the history file, don't overwrite it
shopt -s histappend
# number of commands to remember
HISTSIZE=50000
# expand history before running the command
shopt -s histverify
HISTFILE="$XDG_DATA_HOME/bash_history"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi

export PS1='\[\e[1;34m\]\W \[\e[0;31m\]${?#0}\[\e[32m\]\$ \[\e[0m\]'

