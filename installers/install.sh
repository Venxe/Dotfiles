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

echo "${CYAN}Updating package manager and optimizing mirror list...${RESET}"
sudo sed -i "/^#\[multilib\]/,/^#Include = \/etc\/pacman.d\/mirrorlist/s/^#//" /etc/pacman.conf  
sudo sed -i "s/^#ParallelDownloads/ParallelDownloads/" /etc/pacman.conf
sudo pacman -Syu --noconfirm || error_exit "Failed to update package manager!"
sudo pacman -S --noconfirm reflector || error_exit "Failed to install reflector!"
sudo reflector --country "US,DE,TR,GR" --latest 10 --sort age --save /etc/pacman.d/mirrorlist || error_exit "Failed to optimize mirrors!"

echo "${CYAN}Installing Pacman packages...${RESET}"
xargs -a installers/pacman-packages.txt -r sudo pacman -S --needed --noconfirm || error_exit "Failed to install Pacman packages!"
echo "${CYAN}Removing Dolphin...${RESET}"
sudo pacman -Rns dolphin --noconfirm

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

echo "${CYAN}Installing nnn plugins...${RESET}"
wget https://raw.githubusercontent.com/jarun/nnn/master/plugins/preview-tui \
-O ~/.config/nnn/plugins/preview-tui

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
  timedatectl set-local-rtc 1
'
cp -a dotcfg/.config/* ~/.config/
cp dotcfg/wall-archlinux.png ~/Pictures/Wallpapers/walls/wall-archlinux.png

echo -e "${CYAN}Setting CPU governor to:${RESET} $(echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor)"

echo "${CYAN}Hide unnecessary applications...${RESET}"
bash ~/Dotfiles/dotcfg/wofi-hider.sh || error_exit "Failed to run wofi-hider.sh!"

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
sudo bash -c '
  systemctl enable --now fstrim.timer &&
  systemctl enable bluetooth &&
  systemctl enable avahi-daemon
'
systemctl --user enable pipewire.service pipewire-pulse.service

echo "${CYAN}Cleaning up Dotfiles directory...${RESET}"
rm -rf "$HOME/Dotfiles"

echo "${GREEN}Setup completed successfully!${RESET}"
notify-send "Setup Completed" "Installation successful. Restart for changes to take effect."
