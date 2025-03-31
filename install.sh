#!/bin/bash

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
sudo pacman -S base-devel
makepkg -si
cd ..

sudo chmod -R 777 "$HOME"

pacman -S cmake meson cpio pkg-config reflector rsync swww waybar swaync starship
fastfetch fish neovim hypridle hyprcursor hyprpicker hyprlock fd cava brightnessctl 
nerd-fonts nwg-look materia-gtk-theme thunar gvfs tumbler eza bottom htop libreoffice-
fresh ncspot discord code blueman bluez pipewire pipewire-pulse pipewire-alsa pipewire-
jack pavucontrol pulsemixer gst-plugins-bad

yay -S python-pywal16 python-pywalfox hyprshot pyprland wlogout clock-rs-git qogir-icon-
theme illogical-impulse-bibata-modern-classic-bin spotify gnome-network-displays 

sudo reflector --country "US" --country "DE" --country "TR" --country "GR" --latest 10 --sort age --save /etc/pacman.d/mirrorlist

chsh -s /usr/bin/fish

systemctl enable bluetooth
systemctl --user enable pipewire.service pipewire-pulse.service
systemctl --user start pipewire.service pipewire-pulse.service
sudo systemctl enable avahi-daemon

mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Music ~/Public ~/Templates ~/Videos
mkdir -p ~/Pictures/Wallpapers/walls

cp ~/Dotfiles/starship.toml ~/.config/starship.toml
cp -a ~/Dotfiles/.config/* ~/.config/

cp ~/Dotfiles/wall_archlinux.png ~/Pictures/Wallpapers/pywallpaper.png
cp ~/Dotfiles/wall_archlinux.png ~/Pictures/Wallpapers/walls/wall_archlinux.png
wal -i ~/Dotfiles/wall_archlinux.png
wal -i ~/Dotfiles/wall_archlinux.png -n

rm -rf "$HOME/Dotfiles"

notify-send "Setup Completed" "Installation successful. Restart for changes to take effect."
