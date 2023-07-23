alias ll='ls -lh'
alias la='ls -lAh'
alias dbox="distrobox"

# some colour plz
alias ls='ls --color=auto'
alias grep='grep --color'


if [ $DISTRO = "ubuntu" ]; then
    alias bat="batcat"
fi

if [ $TERM = "xterm-kitty" ] && [ -z "${DISTROBOX_ENTER_PATH}" ]; then
    alias ssh="kitty +kitten ssh"
fi

command -v flashfetch > /dev/null
if [ $? -eq 0 ]; then
    alias neofetch="flashfetch"
fi

