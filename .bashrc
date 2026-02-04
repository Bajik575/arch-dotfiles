# vars
EDITOR="micro"
AUR_INSTALLER="paru"

## ALIASES
# cfg
alias _hypr="$EDITOR .config/hypr/hyprland.conf"
alias _zsh="$EDITOR .zshrc"

# shortcats
alias pcm='sudo pacman -S --noconfirm'
alias aur="${AUR_INSTALLER} -S --noconfirm"
alias sysd="sudo systemctl"
alias b="btop"

# boot
alias logout="hyprctl dispatch exit"
alias off="shutdown now"
alias suspend="systemctl suspend"
alias hibernate="systemctl hibernate"



[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
