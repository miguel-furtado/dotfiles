. "$HOME/.shellcommon/exports"
. "$HOME/.shellcommon/aliases"
. "$HOME/.shellcommon/env"

# Config history
HISTFILE="$XDG_DATA_HOME/zsh_history"
SAVEHIST=50000
HISTFILESIZE=50000
HISTSIZE=50000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data between sessions

# Don't save failed commands to history
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# Bind history search
bindkey '^R' history-incremental-search-backward

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# Ubuntu's command not found package provides instructions to install the
# package that provides the command in case it was not found.
if [ "$DISTRO" = "ubuntu" ] && [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

# zsh-autosuggestions
autosugg_path=/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if [ -f "$autosugg_path" ]; then
    . "$autosugg_path"
fi

arrow="%(?.%F{green}.%F{red})➜%f"
curr_dir="%F{cyan}%B%1~%f%b"
PS1="$arrow $curr_dir "

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# Set up fzf key bindings and fuzzy completion
if command -v fzf &> /dev/null; then
    eval "$(fzf --zsh)"
fi
