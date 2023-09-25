export PATH=$HOME/.local/bin:$HOME/go/bin:$PATH
export EDITOR="nvim"
export DISTRO=$(grep "^ID=" /etc/os-release | cut -d = -f 2)
export DISTRO_FAMILY=$(grep "^ID_LIKE=" /etc/os-release | cut -d = -f 2)

export XDG_DATA_HOME=$HOME/.local/share \
    XDG_CONFIG_HOME=$HOME/.config \
    XDG_STATE_HOME=$HOME/.local/state \
    XDG_CACHE_HOME=$HOME/.cache

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
HISTFILE=$HOME/.bash_history

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# vi keybindings
set -o vi

. "$HOME/.cargo/env"

# asdf
asdf_path=$HOME/.asdf/asdf.sh
if [ -d $asdf_path ]; then
    . asdf_path
fi


# starship prompt
command -v "starship" &> /dev/null
if [ $? -eq 0 ]; then
    eval "$(starship init bash)"
fi

# zoxide
command -v "zoxide" &> /dev/null
if [ $? -eq 0 ]; then
    eval "$(zoxide init bash)"
fi

