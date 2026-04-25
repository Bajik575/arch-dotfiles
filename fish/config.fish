# vars
set -gx EDITOR micro # nemo
set -gx CLI_EDITOR helix # nvim
set -gx GUI_EDITOR zed # code

set -gx AUR_INSTALLER yay # yay
set -gx BROWSER google-chrome # firefox
set -gx FILE_MANAGER nautilus
set -gx MEDIA_PLAYER vlc
set -gx TERMINAL alacritty

if status is-interactive
    # aliases
    # cfg
    alias _niri "$EDITOR ~/.config/niri/config.kdl"
    alias _fish "$EDITOR ~/.config/fish/config.fish"
    
    # one symbol shortcuts
    alias s sudo
    alias g git
    alias z zeditor
    alias m micro
    alias v nvim
    alias h helix
    alias b btop
    alias c clear

    # two symbols shortcuts
    alias py python
    alias ff "fastfetch --logo-color-1 blue --logo-color-2 blue --color blue"
    
    # system control
    alias q exit
    alias hypr-logout "niri msg action quit"
    alias off "systemctl poweroff"
    alias suspend "systemctl suspend"
    alias hibernate "systemctl hibernate"

    # shortcuts
    alias pcm "sudo pacman -S --noconfirm --needed"
    alias pcmrm "sudo pacman -Rns --noconfirm"
    alias aur "$AUR_INSTALLER -S --noconfirm --needed"
    alias aurrm "$AUR_INSTALLER -Rns --noconfirm"
    alias update_system "$AUR_INSTALLER --noconfirm"
    alias sysd "sudo systemctl"
    alias smd-restart "sudo systemctl restart smb nmb winbind"
    alias clock "tty-clock -c"
    alias martix "tmatrix -c default -s 16 -t "" --fade"
    alias x11 "QT_QPA_PLATFORM=xcb GDK_BACKEND=x11 WAYLAND_DISPLAY="
end

# PATH
set -gx PATH $PATH $HOME/.cargo/bin
set -gx PATH $PATH $HOME/.local/bin
set -gx PATH $PATH $HOME/go/bin
set -gx PATH $PATH $HOME/.local/share/solana/install/active_release/bin

# Greeting
set -g fish_greeting ""
