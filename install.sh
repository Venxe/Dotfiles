#!/bin/bash

sudo chmod -R 777 $HOME

yay -S reflector rsync python-pywal16 swww waybar swaync starship myfetch neovim python-pywalfox hypridle \
hyprpicker hyprshot hyprlock pyprland wlogout fd cava brightnessctl clock-rs-git nerd-fonts nwg-look \
qogir-icon-theme materia-gtk-theme illogical-impulse-bibata-modern-classic-bin thunar gvfs tumbler eza \
bottom htop libreoffice-fresh spotify ncspot discord code blueman bluez pipewire pipewire-pulse pipewire-alsa \
pipewire-jack pavucontrol pulsemixer gnome-network-displays gst-plugins-bad

sudo reflector --country 'US' --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

systemctl enable bluetooth
systemctl --user enable pipewire.service pipewire-pulse.service
systemctl --user start pipewire.service pipewire-pulse.service
sudo systemctl enable avahi-daemon

hyprpm add https://github.com/virtcode/hypr-dynamic-cursors
hyprpm enable dynamic-cursors

git clone https://github.com/Venxe/Dotfiles.git ~/Dotfiles
cp -a ~/Dotfiles/.config/* ~/.config/

notify-send "Setup Completed" "Installation successful. Restart for changes to take effect."
