# vars
set -gx EDITOR micro # nemo
set -gx CLI_EDITOR helix # nvim
set -gx GUI_EDITOR zed # code

set -gx AUR_INSTALLER paru # yay
set -gx BROWSER google-chrome # firefox
set -gx FILE_MANAGER nemo
set -gx MEDIA_PLAYER vlc
set -gx TERMINAL alacritty

if status is-interactive
    # aliases
    # cfg
    alias _hypr "$EDITOR ~/.config/niri/niri.kdl"
    alias _fish "$EDITOR ~/.config/fish/config.fish"
    
    # one symbol shortcuts
    alias g git
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
    alias pcm "sudo pacman -S --noconfirm"
    alias aur "$AUR_INSTALLER -S --noconfirm"
    alias sysd "sudo systemctl"
    alias smd-restart "sudo systemctl restart smb nmb winbind"
    alias clock "tty-clock -c"
    alias martix "tmatrix -c default -s 16 -t "" --fade"
    
    zoxide init fish | source
end

# PATH
set -gx PATH $PATH $HOME/.cargo/bin
set -gx PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/go/bin
set -gx PATH $PATH $HOME/.local/share/solana/install/active_release/bin:$PATH

# Greeting
set -g fish_greeting ""
