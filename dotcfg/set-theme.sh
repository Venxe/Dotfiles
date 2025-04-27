#!/usr/bin/env bash

eval $(dbus-launch --sh-syntax)

# GNOME GSettings ayarları
gsettings set org.gnome.desktop.interface gtk-theme "Materia-dark-compact"
gsettings set org.gnome.desktop.interface icon-theme "kora"
gsettings set org.gnome.desktop.interface cursor-theme "Qogir-manjaro-dark"
gsettings set org.gnome.desktop.interface cursor-size 21
gsettings set org.gnome.desktop.interface font-name "Fira Sans 11"
gsettings set org.gnome.desktop.interface font-hinting "slight"
gsettings set org.gnome.desktop.interface font-antialiasing "grayscale"
gsettings set org.gnome.desktop.interface font-rgba-order "rgb"
gsettings set org.gnome.desktop.interface text-scaling-factor 1
gsettings set org.gnome.desktop.interface toolbar-style "both-horiz"
gsettings set org.gnome.desktop.interface toolbar-icons-size "small"
gsettings set org.gnome.desktop.sound event-sounds true
gsettings set org.gnome.desktop.sound input-feedback-sounds false
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# GTK3/GTK4 ayar dosyaları
mkdir -p ~/.config/gtk-{3.0,4.0}
cat > ~/.config/gtk-3.0/settings.ini <<EOF
[Settings]
gtk-theme-name=Materia-dark-compact
gtk-icon-theme-name=kora
gtk-font-name=Fira Sans 11
gtk-cursor-theme-name=Qogir-manjaro-dark
gtk-cursor-theme-size=21
gtk-toolbar-style=GTK_TOOLBAR_ICONS
gtk-toolbar-icon-size=GTK_ICON_SIZE_SMALL_TOOLBAR
gtk-button-images=0
gtk-menu-images=0
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb
EOF

ln -sf ~/.config/gtk-3.0/settings.ini ~/.config/gtk-4.0/settings.ini

# GTK2 ayar dosyası
cat > ~/.gtkrc-2.0 <<EOF
gtk-theme-name="Materia-dark-compact"
gtk-icon-theme-name="kora"
gtk-font-name="Fira Sans 11"
gtk-cursor-theme-name="Qogir-manjaro-dark"
gtk-cursor-theme-size=21
gtk-toolbar-style=GTK_TOOLBAR_ICONS
gtk-toolbar-icon-size=GTK_ICON_SIZE_SMALL_TOOLBAR
gtk-button-images=0
gtk-menu-images=0
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintslight"
gtk-xft-rgba="rgb"
EOF

# İmleç teması için fallback ayarı
mkdir -p ~/.local/share/icons/default
cat > ~/.local/share/icons/default/index.theme <<EOF
[Icon Theme]
Name=Default
Inherits=Qogir-manjaro-dark
EOF

echo "Tüm tema ayarları başarıyla uygulandı!"
