[![sayimburak's Dotfiles](banner.jpg)](https://github.com/Venxe/Dotfiles)

<p align="center">
  <a href="https://www.buymeacoffee.com/sayimburak" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 28px !important;" ></a>
</p>

This repository contains my personal dotfiles for setting up a highly customized and optimized Hyprland environment on Arch Linux. The dotfiles prioritize a minimalist and efficient approach, offering a lightweight and high-performance user experience.

The installation process is fully automated and specifically tailored to my personal workflow.

🐧 **Operating System:** Arch Linux

🖼️ **Window Manager:** Hyprland

🖥️ **Display Manager:** SDDM

> [!WARNING]  
> Running this setup may install software and configurations that could conflict with your preferences. You may want to review the [packages](https://github.com/Venxe/Dotfiles/tree/main/installers) before proceeding.


## ⚙️ Installation

Run the following command in the terminal to download and install the dotfiles:
```bash
git clone https://github.com/Venxe/Dotfiles.git && cd Dotfiles && chmod +x installers/install.sh && ./installers/install.sh
```

### Recomandations:

- [**Wallpapers**](https://github.com/sayimburak/wallpapers) – A curated collection of high-resolution wallpapers

- [**GameMode**](https://github.com/FeralInteractive/gamemode) – A range of performance and usability optimizations


## ⌨️ Keybinds

`SUPER + Q`  - Open Terminal

`SUPER + E`  - Open File Manager

`SUPER + R`  - App Launcher

`SUPER + C`  - Force Close Window

`SUPER + V`  - Toggle Floating

`SUPER + L`  - Lock Session

`SUPER + F`  - Fullscreen

`SUPER + G`  - Audio Manager

`SUPER + T`  - Task Manager

`SUPER + M` - Force Close Hyprland

`SUPER + W`  - Wallpaper Selector

`SUPER + 0-9` - Switch Workspace

`SUPER + SHIFT + 0-9` - Move to Workspace

`ALT + E`  - Emote Selector

`ALT + F4`  - Session Manager

> [!Tip]
> For the full set of key bindings, please refer to `~/.config/hypr/hyprland.conf` file.


## 🗃️ My Apps

Below is a comprehensive, categorized list of all applications installed automatically during setup:

<details>
<summary>📦 System & Package Management</summary>

- **pacman-contrib**
- **rsync**
- **cpio**
- **bluez**
- **blueman**
- **wl-clip-persist**
- **thunar**
- **gvfs**
- **libgsf**
- **tumbler**
- **ffmpegthumbnailer**
- **7zip**
- **xarchiver**
- **bleachbit**
- **flatpak**
- **gnome-keyring**
- **gnome-network-displays**
- **com.github.tchx84.Flatseal**
- **io.github.flattool.Warehouse**
</details>

<details>
<summary>💻 Terminal & CLI Tools</summary>

- **fish**
- **starship**
- **fastfetch**
- **myfetch**
- **eza**
- **fd**
- **nnn**
- **less**
- **btop**
- **cava**
- **pulsemixer**
- **clock-rs-git**
</details>

<details>
<summary>🎨 Desktop Customization & Appearance</summary>

- **swww**
- **waybar**
- **swaync**
- **hypridle**
- **hyprlock**
- **hyprpicker**
- **brightnessctl**
- **gammastep**
- **nwg-look**
- **materia-gtk-theme**
- **ttf-fira-sans**
- **ttf-firacode-nerd**
- **ttf-jetbrains-mono**
- **python-pywal16**
- **python-pywalfox**
- **hyprshot**
- **pyprland**
- **wlogout**
- **kora-icon-theme**
- **qogir-icon-theme**
</details>

<details>
<summary>🎥 Multimedia & Audio</summary>

- **mpv**
- **swayimg**
- **qt6-multimedia**
- **easyeffects**
- **lsp-plugins**
- **gst-plugins-bad**
- **calf**
- **obs-studio**
- **spotify**
- **spicetify-cli**
- **spicetify-marketplace-bin**
- **ncspot**
- **yt-dlp**
</details>

<details>
<summary>🛠️ Productivity & Development</summary>

- **libreoffice-fresh**
- **thunderbird**
- **obsidian**
- **code**
- **neovim**
- **cmake**
- **meson**
- **io.github.shiftey.Desktop**
- **io.github.Qalculate**
</details>

<details>
<summary>💬 Internet & Communication</summary>

- **discord**
- **qbittorrent**
- **org.localsend.localsend_app**
- **org.telegram.desktop**
- **it.mijorus.smile**
- **io.github.halfmexican.Mingle**
- **com.rustdesk.RustDesk**
</details>

<details>
<summary>🎮 Gaming & Entertainment</summary>

- **steam**
- **lutris**
- **bastet**
- **cmatrix**
- **pipes-rs**
- **lolcat**
- **asciiquarium**
- **com.heroicgameslauncher.hgl**
- **com.vysp3r.ProtonPlus**
</details>

<details>
<summary>🔒 Security & Privacy</summary>
  
- **bitwarden**
- **io.ente.auth**
- **com.protonvpn.www**
- **org.torproject.torbrowser-launcher**
</details>


## ⚡ Note
After installation, you may need to adjust the configuration for your specific monitor(s) in the `hyprland.conf` file.<br>
You can view your connected monitors and their properties by running the `hyprctl monitors` command in the terminal.
