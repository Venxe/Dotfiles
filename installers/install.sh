#!/bin/bash

# Define colors for output
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)

echo "${CYAN}Setting permissions for the home directory...${RESET}"
sudo chmod -R 777 "$HOME" || { echo "${RED}Error: Failed to set permissions!${RESET}"; exit 1; }

echo "${CYAN}Updating package manager...${RESET}"
sudo pacman -Syu --noconfirm || { echo "${RED}Error: Failed to update package manager!${RESET}"; exit 1; }

echo "${CYAN}Installing essential Pacman packages...${RESET}"
xargs -a installers/pacman-packages.txt sudo pacman -S || { echo "${RED}Error: Failed to install Pacman packages!${RESET}"; exit 1; }

echo "${CYAN}Installing Flatpak applications...${RESET}"
xargs -a installers/flatpak-packages.txt -r flatpak install -y flathub --noninteractive || { echo "${RED}Error: Failed to install Flatpak applications!${RESET}"; exit 1; }

echo "${CYAN}Installing Yay AUR helper...${RESET}"
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si --noconfirm || { echo "${RED}Error: Failed to install Yay!${RESET}"; exit 1; }
cd ..

echo "${CYAN}Installing Yay packages...${RESET}"
xargs -a installers/yay-packages.txt -r yay -S --noconfirm || { echo "${RED}Error: Failed to install Yay packages!${RESET}"; exit 1; }

echo "${CYAN}Optimizing mirror list...${RESET}"
sudo reflector --country "US,DE,TR,GR" --latest 10 --sort age --save /etc/pacman.d/mirrorlist || { echo "${RED}Error: Failed to optimize mirrors!${RESET}"; exit 1; }

echo "${CYAN}Enabling system services...${RESET}"
systemctl enable bluetooth
systemctl --user enable pipewire.service pipewire-pulse.service
systemctl --user start pipewire.service pipewire-pulse.service
sudo systemctl enable avahi-daemon

echo "${CYAN}Creating necessary directories...${RESET}"
mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Music ~/Public ~/Templates ~/Videos
mkdir -p ~/Pictures/Wallpapers/walls

echo "${CYAN}Copying configuration files...${RESET}"
cp home/starship.toml ~/.config/starship.toml
cp -a home/.config/* ~/.config/

echo "${CYAN}Setting default wallpaper...${RESET}"
cp installers/wall-archlinux.png ~/Pictures/Wallpapers/pywallpaper.png
cp installers/wall-archlinux.png ~/Pictures/Wallpapers/walls/wall-archlinux.png
wal -i ~/Pictures/Wallpapers/walls/wall-archlinux.png -n

echo "${CYAN}Changing default shell to Fish...${RESET}"
while true; do
    echo "${YELLOW}Enter your password to change the shell to Fish:${RESET}"
    if chsh -s /usr/bin/fish; then
        echo "${GREEN}Shell successfully changed to Fish.${RESET}"
        break
    else
        echo "${RED}Authentication failed! Please try again.${RESET}"
        sleep 2
    fi
done

echo "${CYAN}Cleaning up Dotfiles directory...${RESET}"
rm -rf "$HOME/Dotfiles"

echo "${GREEN}Setup completed successfully!${RESET}"
notify-send "Setup Completed" "Installation successful. Restart for changes to take effect."
