#!/bin/bash

echo -e "\033[34mInstalling yay-bin repository...\033[0m"
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
sudo pacman -S base-devel
makepkg -si
cd ..

echo -e "\033[34mInstalling essential packages...\033[0m"
sudo pacman -S cmake meson cpio pkg-config

echo -e "\033[34mSetting home directory permissions...\033[0m"
sudo chmod -R 777 "$HOME"

echo -e "\033[34mInstalling packages using yay...\033[0m"
yay -S reflector rsync python-pywal16 swww waybar swaync starship fastfetch neovim python-pywalfox hypridle \
hyprcursor hyprpicker hyprshot hyprlock pyprland wlogout fd cava brightnessctl clock-rs-git nerd-fonts nwg-look \
qogir-icon-theme materia-gtk-theme illogical-impulse-bibata-modern-classic-bin thunar gvfs tumbler eza \
bottom htop libreoffice-fresh spotify ncspot discord code blueman bluez pipewire pipewire-pulse pipewire-alsa \
pipewire-jack pavucontrol pulsemixer gnome-network-displays gst-plugins-bad

echo -e "\033[34mUpdating mirror list...\033[0m"
sudo reflector --country "US" --country "DE" --country "TR" --country "GR" --latest 10 --sort age --save /etc/pacman.d/mirrorlist

echo -e "\033[34mEnabling services...\033[0m"
systemctl enable bluetooth
systemctl --user enable pipewire.service pipewire-pulse.service
systemctl --user start pipewire.service pipewire-pulse.service
sudo systemctl enable avahi-daemon

echo -e "\033[34mInstalling configs...\033[0m"
mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Music ~/Public ~/Templates ~/Videos
mkdir -p ~/Pictures/Wallpapers/walls

# Duvar kağıdını yerel Dotfiles deponuzdan alıyoruz
cp ~/Dotfiles/wallpapers/pywallpaper.png ~/Pictures/Wallpapers/pywallpaper.png
cp ~/Dotfiles/wallpapers/pywallpaper.png ~/Pictures/Wallpapers/walls/wall_archlinux.png

# Starship config dosyasını doğru şekilde indiriyoruz
curl -L https://raw.githubusercontent.com/Venxe/Dotfiles/main/starship.toml -o ~/.config/starship.toml

# Dotfiles depo klasörünü mevcut yerel dosya üzerinden kullanıyoruz
cp -a ~/Dotfiles/.config/* ~/.config/

echo -e "\033[34mApplying wallpaper and updating colors...\033[0m"
wal -i ~/Pictures/Wallpapers/pywallpaper.png -n

echo -e "\033[34mCleaning up temporary files...\033[0m"
rm -rf yay-bin install.sh

notify-send "Setup Completed" "Installation successful. Restart for changes to take effect."
