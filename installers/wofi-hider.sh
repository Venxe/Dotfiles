#!/bin/bash
set -euo pipefail

for file in /usr/share/applications/in.lsp*.desktop; do
  if [ -f "$file" ]; then
    if grep -q "^Hidden=" "$file"; then
      sudo sed -i "s/^Hidden=.*/Hidden=true/" "$file"
    else
      sudo sed -i "/^\[Desktop Entry\]/a Hidden=true" "$file"
    fi
  fi
done

programs=(
"avahi-discover"
"bssh.desktop"
"bvnc.desktop"

)

for prog in "${programs[@]}"; do
  desktop_file="/usr/share/applications/${prog}.desktop"
  if [ -f "$desktop_file" ]; then
    if grep -q "^Hidden=" "$desktop_file"; then
      sudo sed -i "s/^Hidden=.*/Hidden=true/" "$desktop_file"
    else
      sudo sed -i "/^\[Desktop Entry\]/a Hidden=true" "$desktop_file"
    fi
  fi
done
