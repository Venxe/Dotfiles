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

`SUPER + Q`  - Launch Terminal

`SUPER + E`  - Launch File Manager

`SUPER + R`  - Launch App Launcher

`SUPER + C`  - Close Window

`SUPER + F`  - Toggle Fullscreen

`SUPER + V`  - Toggle Floating

`SUPER + L`  - Lock Session

`SUPER + M`  - Kill Hyprland

`SUPER + T`  - Open Task Manager

`SUPER + A`  - Open Audio Manager

`SUPER + W`  - Wallpaper Manager

`SUPER + 0-9` - Switch to Workspace

`SUPER + SHIFT + 0-9` - Move Window to Workspace

> [!Tip]
> For the full set of key bindings, please refer to `~/.config/hypr/hyprland.conf` file.


## 🗃️ My Apps

Below is a comprehensive, categorized list of all applications installed automatically during setup:

<details><summary>📦 System &amp; Package Management</summary>

| Application            | Description                                         |
| ---------------------- | --------------------------------------------------- |
| pacman‑contrib         | Extra scripts and tools for Pacman                  |
| rsync                  | Fast file synchronization for local/remote backups  |
| cpio                   | Creates and extracts System V archives              |
| bluez                  | Core Bluetooth protocol stack                       |
| blueman                | GTK front‑end for Bluetooth management              |
| wl‑clip‑persist        | Wayland clipboard saver                             |
| thunar                 | Lightweight file manager                            |
| gvfs                   | Virtual file‑system for remote access               |
| libgsf                 | Library for structured file formats                 |
| tumbler                | Thumbnail generation service                        |
| ffmpegthumbnailer      | Video thumbnail creator                             |
| 7zip                   | Multi‑format archive manager                        |
| Xarchiver              | GUI for various archive formats                     |
| BleachBit              | Disk‑cleaning utility                               |
| Flatpak                | Sandbox‑based app distribution                      |
| gnome‑keyring          | Credential storage daemon                           |
| gnome‑network‑displays | Wireless display casting                            |
| Flatseal               | GUI for Flatpak permissions                         |
| Warehouse              | Flatpak app store frontend                          |

</details> <details><summary>💻 Terminal &amp; CLI Tools</summary>

| Application  | Description                             |
| ------------ | --------------------------------------- |
| fish         | Interactive shell with autosuggestions  |
| starship     | Fast, customizable shell prompt         |
| fastfetch    | Quick system info display               |
| myfetch      | Customizable info fetcher               |
| eza          | Enhanced ls replacement                 |
| fd           | Simple, fast file search                |
| nnn          | Terminal based file manager             |
| less         | Text pager                              |
| btop         | Resource usage monitor                  |
| cava         | Terminal audio visualizer               |
| pulsemixer   | CLI mixer for PulseAudio                |
| clock‑rs‑git | Terminal clock utility                  |

</details> <details><summary>🎨 Desktop Customization &amp; Appearance</summary>

| Application        | Description                           |
| ------------------ | ------------------------------------- |
| swww               | Wayland wallpaper manager             |
| waybar             | Status bar for Sway/Hyprland          |
| swaync             | Network indicator for Waybar          |
| hyprshade          | Hyprland screen tone adjuster         |
| hypridle           | Hyprland idle handler                 |
| hyprlock           | Hyprland screen locker                |
| hyprpicker         | Wayland color picker                  |
| brightnessctl      | Adjust backlight via CLI              |
| gammastep          | Time‑based color temperature adjuster |
| nwg‑look           | GTK theme installer                   |
| materia‑gtk‑theme  | Material‑style GTK theme              |
| ttf‑fira‑sans      | Fira Sans font family                 |
| ttf‑firacode‑nerd  | Fira Code with dev ligatures          |
| ttf‑jetbrains‑mono | JetBrains Mono coding font            |
| python‑pywal16     | Pywal for Python 3.10                 |
| python‑pywalfox    | Apply Pywal themes to Firefox         |
| hyprshot           | Hyprland screenshot tool              |
| pyprland           | Python‑based Hyprland config manager  |
| wlogout            | Wayland logout/menu UI                |
| kora‑icon‑theme    | Kora icon set                         |
| qogir‑icon‑theme   | Qogir icon set                        |

</details> <details><summary>🎥 Multimedia &amp; Audio</summary>

| Application               | Description                                     |
| ------------------------- | ----------------------------------------------- |
| mpv                       | CLI media player with wide format support       |
| swayimg                   | Wayland image viewer                            |
| qt6‑multimedia            | Qt6 media codecs/plugins                        |
| easyeffects               | Real‑time audio effects for PipeWire/PulseAudio |
| lsp‑plugins               | Audio effect plugins for JACK/PipeWire          |
| gst‑plugins‑bad           | Extra GStreamer codecs                          |
| calf                      | JACK audio effects suite                        |
| OBS Studio                | Screencast and live‑streaming app               |
| Spotify                   | Music streaming client                          |
| spicetify‑cli             | Customize Spotify client                        |
| spicetify‑marketplace‑bin | Spicetify plugin/theme repository               |
| ncspot                    | Terminal Spotify client                         |
| yt‑dlp                    | Download audio/video from web                   |

</details> <details><summary>🛠️ Productivity &amp; Development</summary>

| Application               | Description                 |
| ------------------------- | --------------------------- |
| LibreOffice Fresh         | Full office suite           |
| Thunderbird               | Email and newsgroup client  |
| Obsidian                  | Markdown‑based note‑taking  |
| Visual Studio Code        | Extensible code editor      |
| Neovim                    | Vim‑based modal editor      |
| CMake                     | Build‑system generator      |
| Meson                     | Fast build system           |
| GitHub Desktop            | GUI for Git version control |
| Qalculate!                | Scientific calculator       |

</details> <details><summary>💬 Internet &amp; Communication</summary>

| Application      | Description                      |
| ---------------- | -------------------------------- |
| Discord          | Voice, video, text chat platform |
| qBittorrent      | BitTorrent client                |
| LocalSend        | P2P LAN file transfer            |
| Telegram Desktop | Official Telegram client         |
| Smile            | Customizable emoji picker        |
| Mingle           | Emoji combiner                   |
| RustDesk         | Remote‑desktop tool              |

</details> <details><summary>🎮 Gaming &amp; Entertainment</summary>

| Application           | Description                                    |
| --------------------- | ---------------------------------------------- |
| Steam                 | Game distribution and community platform       |
| Lutris                | Manages Windows/Linux games via Wine/emulators |
| Bastet                | Terminal Tetris clone                          |
| cmatrix               | “Matrix” rain in terminal                      |
| pipes‑rs              | ASCII pipeline simulation                      |
| lolcat                | Rainbow‑colorizes text                         |
| asciiquarium          | Animated ASCII aquarium                        |
| Heroic Games Launcher | GUI for Epic/GOG games                         |
| ProtonPlus            | GUI for Proton compatibility layer             |

</details> <details><summary>🔒 Security &amp; Privacy</summary>

| Application          | Description                       |
| -------------------- | --------------------------------- |
| Bitwarden            | Encrypted password manager        |
| Ente Auth            | Multi‑factor authentication agent |
| ProtonVPN            | Secure VPN client                 |
| Tor Browser Launcher | Launches/updates Tor Browser      |

</details>


## ⚡ Notes
<details>
<summary>After installation, you may need to adjust the configuration for your specific monitor(s).</summary>

You can view your connected monitors and their properties by running the `hyprctl monitors` command in the terminal.
</details>

<details>
<summary>After signing in to Spotify, you must configure a few settings for applying Spicetify.</summary>

```
spicetify config current_theme marketplace
spicetify config custom_apps marketplace
spicetify backup apply
```

My Marketplace Items:
- **Extensions:** Full Screen, Scanabbles
- **Themes:** Comfy
- **Snippets:** Hover Panels, Rounded Images, Auto-hide Friends, Pretty Lyrics, Smooth Progress/Volume Bar, Modern ScrollBar, Remove the Artist and Credits sections from the Sidebar
</details>
