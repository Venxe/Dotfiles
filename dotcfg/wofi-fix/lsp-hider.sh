#!/bin/bash

for file in /usr/share/applications/in.lsp*.desktop; do
    if [ -f "$file" ]; then
        echo "Düzenleniyor: $file"
        if grep -q "^Hidden=" "$file"; then
            sudo sed -i "s/^Hidden=.*/Hidden=true/" "$file"
        else
            sudo sed -i "/^\[Desktop Entry\]/a Hidden=true" "$file"
        fi
    fi
done
