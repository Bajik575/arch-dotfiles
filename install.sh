read -p "Do you have bluetooth? [y/n] " is_bluetooth
if [[ "$is_bluetooth" != "y" && "$is_bluetooth" != "n" ]]; then exit 1; fi
read -p "Do you have audio? [y/n] " is_audio
if [[ "$is_audio" != "y" && "$is_audio" != "n" ]]; then exit 1; fi
read -p "Do you have wifi? [y/n] " is_wifi
if [[ "$is_wifi" != "y" && "$is_wifi" != "n" ]]; then exit 1; fi

install_command="sudo pacman -S --noconfirm --needed"
install_aur_command="yay -S --needed"

sudo pacman -Syu --noconfirm --needed

$install_command base-devel git # base
$install_command niri waybar fuzzel mako nautilus # main
$install_command wl-clipboard wl-clip-persist cliphist # clipboard
$install_command ttf-jetbrains-mono-nerd noto-fonts-emoji # fonts
$install_command libnotify polkit xdg-desktop-portal xdg-desktop-portal-gnome gnome-keyring # libs
$install_command xdgctl chafa yazi # cli useful
$install_command clapper imv # gui useful
$install_command swaybg swayosd swayidle hyprlock # special
$install_command telegram-desktop firefox zed # weight-heavy apps
$install_command 7z file-roller # archieves

if ! command -v yay &> /dev/null; then
	git clone https://aur.archlinux.org/yay.git yay_tmp
	cd yay_tmp || exit 1
	makepkg -si --noconfirm || exit 1
	cd ..
	rm -rf yay_tmp
fi

$install_aur_command bemoji soteria-bin # emoji chooser, polkit
$install_aur_command tokyonight-gtk-theme-git
$install_aur_command bibata-cursor-theme-bin

if [[ "$is_bluetooth" == "y" ]]; then
	$install_command bluez
	$install_aur_command bluetui
fi
if [[ "$is_audio" == "y" ]]; then
	$install_command pipewire pipewire-pulse wireplumber alsa-utils pulsemixer
	$install_command mpd mpc rmpc
	sudo systemd enable --now --user mpd
	$install_command gst-libav gst-plugins-bad gst-plugins-ugly # decoders for audio and music
fi
if [[ "$is_wifi" == "y" ]]; then
	$install_command networkmanager
	$install_aur_command wifitui
fi
