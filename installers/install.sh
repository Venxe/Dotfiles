#!/bin/bash

clear

sudo -v

LOG_FILE="setup_log.txt"
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

# Log dosyasına başlangıç tarihi yaz
echo "Setup started at $(date)" > "$LOG_FILE"

# Hata yönetimi fonksiyonu
error_exit() {
    echo -e "${RED}Error: $1${RESET}" >&2
    echo "Error: $1 at $(date)" >> "$LOG_FILE"
    exit 1
}

# Loglara yazacak bir fonksiyon
log_message() {
    echo "$1"
    echo "$1" >> "$LOG_FILE"
}

# Kurulum adımlarını log dosyasına yönlendir
log_message "${CYAN}Setting permissions for the home directory...${RESET}"
sudo chmod -R 777 "$HOME" >> "$LOG_FILE" 2>&1 || error_exit "Failed to set permissions!"

log_message "${CYAN}Updating package manager...${RESET}"
sudo pacman -Syu --noconfirm >> "$LOG_FILE" 2>&1 || error_exit "Failed to update package manager!"

log_message "${CYAN}Installing essential Pacman packages...${RESET}"
xargs -a installers/pacman-packages.txt -r sudo pacman -S --needed >> "$LOG_FILE" 2>&1 || error_exit "Failed to install Pacman packages!"

log_message "${CYAN}Installing Flatpak applications...${RESET}"
xargs -a installers/flatpak-packages.txt -r flatpak install -y flathub --noninteractive >> "$LOG_FILE" 2>&1 || error_exit "Failed to install Flatpak applications!"

log_message "${CYAN}Installing Yay AUR helper...${RESET}"
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay-bin.git >> "$LOG_FILE" 2>&1 && pushd yay-bin
    makepkg -si --noconfirm >> "$LOG_FILE" 2>&1 || error_exit "Failed to install Yay!"
    popd
else
    log_message "${GREEN}Yay is already installed, skipping.${RESET}"
fi

log_message "${CYAN}Installing Yay packages...${RESET}"
xargs -a installers/yay-packages.txt -r yay -S --needed --noconfirm >> "$LOG_FILE" 2>&1 || error_exit "Failed to install Yay packages!"

log_message "${CYAN}Optimizing mirror list...${RESET}"
sudo reflector --country "US,DE,TR,GR" --latest 10 --sort age --save /etc/pacman.d/mirrorlist >> "$LOG_FILE" 2>&1 || error_exit "Failed to optimize mirrors!"

log_message "${CYAN}Enabling system services...${RESET}"
systemctl enable bluetooth >> "$LOG_FILE" 2>&1
systemctl --user enable pipewire.service pipewire-pulse.service >> "$LOG_FILE" 2>&1
systemctl --user start pipewire.service pipewire-pulse.service >> "$LOG_FILE" 2>&1
sudo systemctl enable avahi-daemon >> "$LOG_FILE" 2>&1

log_message "${CYAN}Creating necessary directories...${RESET}"
mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Music ~/Public ~/Templates ~/Videos >> "$LOG_FILE" 2>&1
mkdir -p ~/Pictures/Wallpapers/walls >> "$LOG_FILE" 2>&1

log_message "${CYAN}Copying configuration files...${RESET}"
cp home/starship.toml ~/.config/starship.toml >> "$LOG_FILE" 2>&1
cp -a home/.config/* ~/.config/ >> "$LOG_FILE" 2>&1

log_message "${CYAN}Setting default wallpaper...${RESET}"
cp installers/wall-archlinux.png ~/Pictures/Wallpapers/pywallpaper.png >> "$LOG_FILE" 2>&1
cp installers/wall-archlinux.png ~/Pictures/Wallpapers/walls/wall-archlinux.png >> "$LOG_FILE" 2>&1
wal -i ~/Pictures/Wallpapers/walls/wall-archlinux.png -n >> "$LOG_FILE" 2>&1

log_message "${CYAN}Changing default shell to Fish...${RESET}"
while true; do
    log_message "${YELLOW}Enter your password to change the shell to Fish:${RESET}"
    if chsh -s /usr/bin/fish >> "$LOG_FILE" 2>&1; then
        log_message "${GREEN}Shell successfully changed to Fish.${RESET}"
        break
    else
        log_message "${RED}Authentication failed! Please try again.${RESET}"
        sleep 2
    fi
done

log_message "${CYAN}Cleaning up Dotfiles directory...${RESET}"
rm -rf "$HOME/Dotfiles" >> "$LOG_FILE" 2>&1

log_message "${GREEN}Setup completed successfully!${RESET}"
notify-send "Setup Completed" "Installation successful. Restart for changes to take effect."

# Kurulum bitişi
echo "Setup completed at $(date)" >> "$LOG_FILE"
