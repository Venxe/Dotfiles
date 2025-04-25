#!/usr/bin/env bash

set -euo pipefail

for file in \
    /usr/share/applications/in.lsp*.desktop \
    /usr/share/applications/avahi-discover.desktop \
    /usr/share/applications/blueman-manager.desktop \
    /usr/share/applications/bssh.desktop \
    /usr/share/applications/bvnc.desktop \
    /usr/share/applications/calf.desktop \
    /usr/share/applications/cmake-gui.desktop \
    /usr/share/applications/electron34.desktop \
    /usr/share/applications/gammastep-indicator.desktop \
    /usr/share/applications/lstopo.desktop \
    /usr/share/applications/qv4l2.desktop \
    /usr/share/applications/qvidcap.desktop \
    /usr/share/applications/thunar-bulk-rename.desktop \
    /usr/share/applications/thunar-settings.desktop \
    /var/lib/flatpak/exports/share/applications/org.torproject.torbrowser-launcher.settings.desktop
do
    if [ -f "$file" ]; then
        if grep -q "^Hidden=" "$file"; then
            sudo sed -i 's/^Hidden=.*/Hidden=true/' "$file"
        else
            sudo sed -i '/^\[Desktop Entry\]/a Hidden=true' "$file"
        fi
    fi
done
