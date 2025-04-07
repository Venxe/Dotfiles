#!/bin/bash

clear

echo -e "\e[36m"
cat << "EOF"

┌─┐┌─┐┬ ┬┬┌┬┐┌┐ ┬ ┬┬─┐┌─┐┬┌─ ┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┬┬  ┌─┐┌─┐
└─┐├─┤└┬┘││││├┴┐│ │├┬┘├─┤├┴┐  └─┐   ║║│ │ │ ├┤ ││  ├┤ └─┐
└─┘┴ ┴ ┴ ┴┴ ┴└─┘└─┘┴└─┴ ┴┴ ┴  └─┘  ═╩╝└─┘ ┴ └  ┴┴─┘└─┘└─┘

EOF
echo -e "\e[0m"

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)

error_exit() {
    echo -e "${RED}Error: $1${RESET}" >&2
    exit 1
}

echo "${CYAN}Setting permissions for the home directory...${RESET}"
sudo chmod -R 777 "$HOME" || error_exit "Failed to set permissions!"

echo "${CYAN}Updating package manager...${RESET}"
sudo pacman -Syu --noconfirm || error_exit "Failed to update package manager!"

echo "${CYAN}Installing Pacman packages...${RESET}"
xargs -a installers/pacman-packages.txt -r sudo pacman -S --needed || error_exit "Failed to install Pacman packages!"

echo "${CYAN}Installing Flatpak applications...${RESET}"
xargs -a installers/flatpak-packages.txt -r flatpak install -y flathub --noninteractive || error_exit "Failed to install Flatpak applications!"

echo "${CYAN}Installing Yay AUR helper...${RESET}"
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay-bin.git && pushd yay-bin
    makepkg -si --noconfirm || error_exit "Failed to install Yay!"
    popd
else
    echo "${GREEN}Yay is already installed, skipping.${RESET}"
fi

echo "${CYAN}Installing Yay packages...${RESET}"
xargs -a installers/yay-packages.txt -r yay -S --needed --noconfirm || error_exit "Failed to install Yay packages!"

echo "${CYAN}Optimizing mirror list...${RESET}"
sudo reflector --country "US,DE,TR,GR" --latest 10 --sort age --save /etc/pacman.d/mirrorlist || error_exit "Failed to optimize mirrors!"

echo "${CYAN}Creating necessary directories...${RESET}"
mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Games ~/Music ~/Public ~/Templates ~/Videos
mkdir -p ~/Pictures/Wallpapers/walls

echo "${CYAN}Installing configuration files...${RESET}"
sudo bash -c '
  cp -a dotcfg/resolved.conf /etc/systemd/resolved.conf &&
  cp -a dotcfg/swappiness.conf /etc/sysctl.d/ &&
  cp -a dotcfg/sb-theme /usr/share/sddm/themes/ &&
  cp -a dotcfg/sddm.conf /etc/sddm.conf &&
  cp -a dotcfg/wofi-fix/. /usr/share/applications/ &&
  sed -i "s/^#\s*ParallelDownloads\s*=\s*5/ParallelDownloads = 5/" /etc/pacman.conf
'
cp -a dotcfg/.config/* ~/.config/

# wofi lsp-hider
for file in /usr/share/applications/in.lsp*.desktop; do
  if [ -f "$file" ]; then
    if grep -q "^Hidden=" "$file"; then
      sudo sed -i "s/^Hidden=.*/Hidden=true/" "$file"
    else
      sudo sed -i "/^\[Desktop Entry\]/a Hidden=true" "$file"
    fi
  fi
done

echo "${CYAN}Setting default wallpaper...${RESET}"
cp dotcfg/wall-archlinux.png ~/Pictures/Wallpapers/pywallpaper.png
cp dotcfg/wall-archlinux.png ~/Pictures/Wallpapers/walls/wall-archlinux.png
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

echo "${CYAN}Enabling system services...${RESET}"
systemctl enable --now fstrim.timer
systemctl enable bluetooth
systemctl --user enable pipewire.service pipewire-pulse.service
sudo systemctl enable avahi-daemon

echo "${CYAN}Cleaning up Dotfiles directory...${RESET}"
rm -rf "$HOME/Dotfiles"

echo "${GREEN}Setup completed successfully!${RESET}"
notify-send "Setup Completed" "Installation successful. Restart for changes to take effect."
