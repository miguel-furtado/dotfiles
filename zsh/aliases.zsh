alias ll='ls -lh'
alias la='ls -lAh'
alias dbox="distrobox"

# some colour plz
alias ls='ls --color=auto'
alias grep='grep --color'

if [[ $DISTRO_FAMILY = "debian" || $DISTRO = "debian" ]]; then
    alias bat="batcat"
fi

if [[ $TERM = "xterm-kitty" ]]; then
    alias ssh="kitty +kitten ssh"
fi

