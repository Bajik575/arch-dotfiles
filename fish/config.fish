if status is-interactive
    # vars
    set -gx EDITOR "micro"
    set -gx AUR_INSTALLER "paru"
    
    # aliases
    # cfg
    alias _hypr "$EDITOR ~/.config/hypr/hyprland.conf"
    alias _fish "$EDITOR ~/.config/fish/config.fish"
    
    # shortcuts
    alias pcm "sudo pacman -S --noconfirm"
    alias aur "$AUR_INSTALLER -S --noconfirm"
    alias sysd "sudo systemctl"
    alias b "btop"
    
    # system control
    alias hypr-logout "hyprctl dispatch exit"
    alias off "shutdown now"
    alias suspend "systemctl suspend"
    alias hibernate "systemctl hibernate"
end
set -g fish_greeting ""
