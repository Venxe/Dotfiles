#!/bin/bash

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
sudo pacman -S base-devel
makepkg -si
cd ..

sudo pacman -S cmake meson cpio pkg-config
sudo chmod -R 777 "$HOME"

yay -S reflector rsync python-pywal16 swww waybar swaync starship fastfetch fish neovim python-pywalfox hypridle \
hyprcursor hyprpicker hyprshot hyprlock pyprland wlogout fd cava brightnessctl clock-rs-git nerd-fonts nwg-look \
qogir-icon-theme materia-gtk-theme illogical-impulse-bibata-modern-classic-bin thunar gvfs tumbler eza \
bottom htop libreoffice-fresh spotify ncspot discord code blueman bluez pipewire pipewire-pulse pipewire-alsa \
pipewire-jack pavucontrol pulsemixer gnome-network-displays gst-plugins-bad

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
