#!/bin/bash

set -e  # Hata oluşursa betiği durdurur

handle_error() {
    echo -e "\033[31mError: $1\033[0m"
    exit 1
}

echo -e "\033[34mCloning yay-bin...\033[0m"
git clone https://aur.archlinux.org/yay-bin.git || handle_error "Failed to clone yay-bin"
cd yay-bin || handle_error "Failed to enter yay-bin directory"

echo -e "\033[34mInstalling base-devel...\033[0m"
sudo pacman -S --needed base-devel || handle_error "Failed to install base-devel"

echo -e "\033[34mBuilding and installing yay...\033[0m"
makepkg -si --noconfirm || handle_error "Failed to install yay"
cd ..
rm -rf yay-bin

echo -e "\033[34mInstalling essential packages...\033[0m"
sudo pacman -S --needed cmake meson cpio pkg-config || handle_error "Failed to install core packages"

echo -e "\033[34mSetting home directory permissions...\033[0m"
sudo chmod -R 777 "$HOME" || handle_error "Failed to set home directory permissions"

echo -e "\033[34mInstalling additional packages...\033[0m"
yay -S --needed reflector rsync python-pywal16 swww waybar swaync starship fastfetch neovim python-pywalfox hypridle \
hyprpicker hyprshot hyprlock pyprland wlogout fd cava brightnessctl clock-rs-git nerd-fonts nwg-look \
qogir-icon-theme materia-gtk-theme illogical-impulse-bibata-modern-classic-bin thunar gvfs tumbler eza \
bottom htop libreoffice-fresh spotify ncspot discord code blueman bluez pipewire pipewire-pulse pipewire-alsa \
pipewire-jack pavucontrol pulsemixer gnome-network-displays gst-plugins-bad || handle_error "Failed to install additional packages"

echo -e "\033[34mUpdating mirrorlist with Reflector...\033[0m"
sudo reflector --country "US" --country "DE" --country "TR" --country "GR" --latest 10 --sort age --save /etc/pacman.d/mirrorlist || handle_error "Failed to update mirrorlist"

echo -e "\033[34mEnabling system services...\033[0m"
sudo systemctl enable bluetooth || handle_error "Failed to enable Bluetooth"
systemctl --user enable pipewire.service pipewire-pulse.service || handle_error "Failed to enable PipeWire services"
systemctl --user start pipewire.service pipewire-pulse.service || handle_error "Failed to start PipeWire services"
sudo systemctl enable avahi-daemon || handle_error "Failed to enable Avahi Daemon"

echo -e "\033[34mInstalling Hyprland plugins...\033[0m"
hyprpm add https://github.com/virtcode/hypr-dynamic-cursors || handle_error "Failed to add Hyprland dynamic cursors"
hyprpm enable dynamic-cursors || handle_error "Failed to enable dynamic cursors"

echo -e "\033[34mCloning and applying Dotfiles...\033[0m"
git clone https://github.com/Venxe/Dotfiles.git ~/Dotfiles || handle_error "Failed to clone Dotfiles"
cp -a ~/Dotfiles/.config/* ~/.config/ || handle_error "Failed to copy Dotfiles"

echo -e "\033[34mCleaning up installation files...\033[0m"
rm -rf ~/Dotfiles install.sh || handle_error "Failed to clean up installation files"

echo -e "\033[32mSetup Completed! Restart for changes to take effect.\033[0m"
notify-send "Setup Completed" "Installation successful. Restart for changes to take effect."
