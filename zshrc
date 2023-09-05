# custom env variables
export PATH=$HOME/.local/bin:$PATH \
    EDITOR="nvim" \
    XDG_CONFIG_HOME=$HOME/.config/ \
    DISTRO=$(grep "^ID=" /etc/os-release | cut -d = -f 2) \
    DISTRO_FAMILY=$(grep "^ID_LIKE=" /etc/os-release | cut -d = -f 2)

# Config history
HISTFILE=~/.local/share/zsh_history
SAVEHIST=50000
HISTFILESIZE=50000
HISTSIZE=50000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data betwenn sessions

# Load aliases
. $HOME/.zsh/aliases.zsh

# enable vim mode
bindkey -v

if [ "$DISTRO" = "ubuntu" ]; then
    # Get ubuntu suggestions on the package to install to provide a command which
    # was not found
    . /etc/zsh_command_not_found
fi

# zsh-autosuggestions
auto_sugg_path="$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [ -f $auto_sugg_path ]; then
    . $auto_sugg_path
fi

# asdf
. $HOME/.asdf/asdf.sh

# starship prompt
command -v "starship" &> /dev/null
if [ $? -eq 0 ]; then
    eval "$(starship init zsh)"
fi

# zoxide
command -v "zoxide" &> /dev/null
if [ $? -eq 0 ]; then
    eval "$(zoxide init zsh)"
fi

