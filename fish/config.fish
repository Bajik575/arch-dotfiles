if status is-interactive
    # vars
    set -gx EDITOR nvim
    set -gx AUR_INSTALLER paru

    # aliases
    # cfg
    alias _hypr "$EDITOR ~/.config/hypr/hyprland.conf"
    alias _fish "$EDITOR ~/.config/fish/config.fish"

    # shortcuts
    alias pcm "sudo pacman -S --noconfirm"
    alias aur "$AUR_INSTALLER -S --noconfirm"
    alias sysd "sudo systemctl"
    alias smd-restart "sudo systemctl restart smb nmb winbind"

    alias g git
    alias m micro
    alias v nvim
    alias b btop
    alias c clear
    alias py python
    alias ff fastfetch

    # system control
    alias q exit
    alias hypr-logout "hyprctl dispatch exit"
    alias off "shutdown now"
    alias suspend "systemctl suspend"
    alias hibernate "systemctl hibernate"
end
set -g fish_greeting ""

set -gx PATH $PATH $HOME/.cargo/bin
set -gx PATH $PATH $HOME/.local/bin
