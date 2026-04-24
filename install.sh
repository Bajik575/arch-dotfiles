read -p "Do you have bluetooth? [y/n] " is_bluetooth
if [[ "$is_bluetooth" != "y" && "$is_bluetooth" != "n" ]]; then exit 1; fi
read -p "Do you have audio? [y/n] " is_audio
if [[ "$is_audio" != "y" && "$is_audio" != "n" ]]; then exit 1; fi
read -p "Do you have wifi? [y/n] " is_wifi
if [[ "$is_wifi" != "y" && "$is_wifi" != "n" ]]; then exit 1; fi

install-command="sudo pacman -S --noconfirm --needed"
install-aur-command="yay -S --needed"

sudo pacman -Syu --noconfirm --needed

$install-command base-devel git # base
$install-command niri waybar fuzzel mako nautilus # main
$install-command wl-clipboard wl-clip-persist cliphist # clipboard
$install-command ttf-jetbrains-mono-nerd noto-fonts-emoji # fonts
$install-command libnotify polkit xdg-desktop-portal xdg-desktop-portal-gnome gnome-keyring # libs
$install-command xdgctl chafa yazi # cli useful
$install-command clapper imv # gui useful
$install-command swaybg swayosd swayidle hyprlock # special
$install-command telegram-desktop firefox zed # weight-heavy apps

if ! command -v yay &> /dev/null; then
	git clone https://aur.archlinux.org/yay.git
	cd yay || exit 1
	makepkg -si --noconfirm || exit 1
	cd ..
	rm -rf yay
fi

$install-aur-command bemoji soteria-bin # emoji chooser, polkit
$install-aur-command tokyonight-gtk-theme-git
$install-aur-command bibata-cursor-theme-bin

if [[ "$is_bluetooth" == "y" ]]; then
	$install-command bluez
	$install-aur-command bluetui
fi
if [[ "$is_audio" == "y" ]]; then
	$install-command pipewire pipewire-pulse wireplumber alsa-utils pulsemixer
	$install-command mpd rmpc
fi
if [[ "$is_wifi" == "y" ]]; then
	$install-command networkmanager
	$install-aur-command wifitui
fi
