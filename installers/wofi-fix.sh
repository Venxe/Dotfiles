#!/usr/bin/env bash
set -euo pipefail

declare -A exec_map=(
  [vim]="kitty -e vim %F"
  [nvim]="kitty -e nvim %F"
  [btop]="kitty -e btop"
  [ncspot]="kitty -e ncspot"
  [bastet]="kitty -e bastet"
  [nnn]="env NNN_FIFO=/tmp/nnn.fifo NNN_PLUG=p:preview-tui kitty -e nnn -a -P p"
  [bitwarden]="pypr toggle passmanager"
  [it.mijorus.smile]="pypr toggle smile"
)

hidden_list=(
  /usr/share/applications/in.lsp*.desktop
  /usr/share/applications/avahi-discover.desktop
  /usr/share/applications/blueman-manager.desktop
  /usr/share/applications/bssh.desktop
  /usr/share/applications/bvnc.desktop
  /usr/share/applications/calf.desktop
  /usr/share/applications/cmake-gui.desktop
  /usr/share/applications/electron*.desktop
  /usr/share/applications/fish.desktop
  /usr/share/applications/gammastep-indicator.desktop
  /usr/share/applications/kitty.desktop
  /usr/share/applications/org.gnome.NetworkDisplays.desktop
  /usr/share/applications/libreoffice-*.desktop
  /usr/share/applications/lstopo.desktop
  /usr/share/applications/qv4l2.desktop
  /usr/share/applications/qvidcap.desktop
  /usr/share/applications/thunar*.desktop
  /var/lib/flatpak/exports/share/applications/org.torproject.torbrowser-launcher.settings.desktop
)

update_exec() {
  local file=$1 cmd=$2
  [ ! -f "$file" ] && return
  sed -i '/^Exec=/d; /^Terminal=/d' "$file"
  sed -i '/^\[Desktop Entry\]/a Exec='"$cmd"'\nTerminal=false' "$file"
}

hide_entry() {
  local file=$1
  [ ! -f "$file" ] && return
  sed -i '/^Hidden=/d' "$file"
  sed -i '/^\[Desktop Entry\]/a Hidden=true' "$file"
}

for app in "${!exec_map[@]}"; do
  update_exec "/usr/share/applications/${app}.desktop" "${exec_map[$app]}"
done

for pattern in "${hidden_list[@]}"; do
  for file in $pattern; do
    hide_entry "$file"
  done
done
