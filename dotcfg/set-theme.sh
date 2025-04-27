#!/usr/bin/env bash
set -e

# Start dbus-launch before gsettings
export $(dbus-launch --sh-syntax)
echo "DBUS_SESSION_BUS_ADDRESS: $DBUS_SESSION_BUS_ADDRESS"

# Environment setup for gsettings and GTK
export XCURSOR_THEME="Qogir-manjaro-dark"
export XCURSOR_SIZE=21

# GSettings - GNOME settings
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
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.sound event-sounds true
gsettings set org.gnome.desktop.sound input-feedback-sounds false

# GTK3 & GTK4 Config
mkdir -p ~/.config/gtk-3.0 ~/.config/gtk-4.0
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
gtk-application-prefer-dark-theme=1
EOF

# Link GTK3 settings to GTK4
ln -sf ~/.config/gtk-3.0/settings.ini ~/.config/gtk-4.0/settings.ini

# GTK2 Settings
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

# Cursor Settings
mkdir -p ~/.local/share/icons/default
cat > ~/.local/share/icons/default/index.theme <<EOF
[Icon Theme]
Name=Default
Inherits=Qogir-manjaro-dark
EOF
