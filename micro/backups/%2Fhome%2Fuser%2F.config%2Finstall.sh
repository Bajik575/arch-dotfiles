read -p "Do you have bluetooth? [y/n] " is_bluetooth
if [[ "$is_bluetooth" != "y" && "$is_bluetooth" != "n" ]]; then exit 1; fi
read -p "Do you have audio? [y/n] " is_audio
if [[ "$is_audio" != "y" && "$is_audio" != "n" ]]; then exit 1; fi
read -p "Do you have wifi? [y/n] " is_wifi
if [[ "$is_wifi" != "y" && "$is_wifi" != "n" ]]; then exit 1; fi
read -p "Do you wanna install additional packages? [y/n] " is_additional
if [[ "$is_additional" != "y" && "$is_additional" != "n" ]]; then exit 1; fi
read -p "Do you wanna add multilib to pacman? [y/n] " is_add_multilib
if [[ "$is_add_multilib" != "y" && "$is_add_multilib" != "n" ]]; then exit 1; fi

install_command="sudo pacman -S --noconfirm --needed"
install_aur_command="yay -S --needed"

if [[ "$is_add_multilib" == "y" ]]; then
	sudo echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
fi
sudo pacman -Syu --noconfirm --needed

$install_command base-devel git # base
$install_command niri waybar fuzzel mako nautilus fish # main
$install_command wl-clipboard wl-clip-persist cliphist # clipboard
$install_command ttf-jetbrains-mono-nerd noto-fonts-emoji # fonts
$install_command libnotify polkit xdg-desktop-portal xdg-desktop-portal-gnome gnome-keyring qt5ct qt6ct qt5-base qt6-base qt5-wayland qt6-wayland libxcb xcb-util-cursor libxcb-cursor0 xorg-xwayland xwayland-satellite # libs
$install_command chafa yazi brightnessctl micro helix # cli useful
$install_command clapper imv # gui useful
$install_command swaybg swayosd swayidle hyprlock # special
$install_command zed # weight-heavy apps
$install_command 7zip file-roller # archieves

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
	$install_aur_command trix-player
	$install_command gst-libav gst-plugins-bad gst-plugins-ugly # decoders for audio and music
fi
if [[ "$is_wifi" == "y" ]]; then
	$install_command networkmanager
	$install_aur_command wifitui
fi
if [[ "$is_additional" == "y" ]]; then
	sudo pacman -S --needed firefox
	sudo pacman -S --needed fastfetch
	sudo pacman -S --needed transmission-gtk
	sudo pacman -S --needed telegram-desktop
	sudo pacman -S --needed nwg-look
	sudo pacman -S --needed nirimod
	sudo pacman -S --needed steam
	yay -S --needed tty-clock
	yay -S --needed tmatrix
	yay -S --needed xdgctl
	yay -S --needed google-chrome
	yay -S --needed happ
	yay -S --needed localsend-bin
fi

sudo groupadd video
sudo usermod -aG video $USER
sudo groupadd sudo
sudo usermod -aG sudo $USER
git config --global credential.helper store
sudo chsh -s /usr/bin/fish user
