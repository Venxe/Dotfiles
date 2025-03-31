#!/bin/bash

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
sudo pacman -S base-devel
makepkg -si
cd ..

sudo chmod -R 777 "$HOME"

sudo pacman -S refrector
sudo reflector --country "US" --country "DE" --country "TR" --country "GR" --latest 10 --sort age --save /etc/pacman.d/mirrorlist

sudo pacman -S $(<installers/packages.txt)

yay -S python-pywal16 python-pywalfox hyprshot pyprland wlogout clock-rs-git qogir-icon-theme qalculate-gtk \
illogical-impulse-bibata-modern-classic-bin spotify gnome-network-displays myfetch proton-vpn-gtk-app kora-icon-theme \
bastet pipes-rs

systemctl enable bluetooth
systemctl --user enable pipewire.service pipewire-pulse.service
systemctl --user start pipewire.service pipewire-pulse.service
sudo systemctl enable avahi-daemon

mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Music ~/Public ~/Templates ~/Videos
mkdir -p ~/Pictures/Wallpapers/walls

cp home/starship.toml ~/.config/starship.toml
cp -a home/.config/* ~/.config/

cp installers/wall_archlinux.png ~/Pictures/Wallpapers/pywallpaper.png
cp installers/wall_archlinux.png ~/Pictures/Wallpapers/walls/wall_archlinux.png
wal -i ~/Pictures/Wallpapers/pywallpaper.png
wal -i ~/Pictures/Wallpapers/pywallpaper.png -n

chsh -s /usr/bin/fish

rm -rf "$HOME/Dotfiles"

notify-send "Setup Completed" "Installation successful. Restart for changes to take effect."
