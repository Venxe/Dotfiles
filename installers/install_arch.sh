#!/bin/bash

sudo chmod -R 777 "$HOME"

sudo pacman -Syu --noconfirm
sudo pacman -S $(<installers/packages.txt)

flatpak install -y flathub com.github.tchx84.Flatseal io.github.flattool.Warehouse com.vysp3r.ProtonPlus

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
sudo pacman -S base-devel
makepkg -si
cd ..

yay -S python-pywal16 python-pywalfox hyprshot pyprland wlogout clock-rs-git qogir-icon-theme qalculate-gtk \
illogical-impulse-bibata-modern-classic-bin spotify gnome-network-displays myfetch proton-vpn-gtk-app kora-icon-theme \
bastet pipes-rs

sudo reflector --country "US,DE,TR,GR" --latest 10 --sort age --save /etc/pacman.d/mirrorlist

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
wal -i ~/Dotfiles/installers/wall_archlinux.png  
wal -i ~/Dotfiles/installers/wall_archlinux.png -n  

while true; do
    echo "Enter your password to change the shell to Fish:"
    if chsh -s /usr/bin/fish; then
        echo "Shell successfully changed to Fish."
        break
    else
        echo "Authentication failed! Please try again."
        sleep 2
    fi
done

rm -rf "$HOME/Dotfiles"

notify-send "Setup Completed" "Installation successful. Restart for changes to take effect."
