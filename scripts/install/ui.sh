#!/usr/bin/bash

# ##############################
# Install Packages
# ##############################
paru -S sway swaybg swayidle swaylock sddm waybar wofi mako wl-clipboard
paru -S swww
paru -S xdg-desktop-portal-wlr grim slurp polkit-gnome grimshot wf-recorder kanshi brightnessctl playerctl pamixer

# Disable GDM & Enable SDDM
sudo systemctl disable gdm.service
sudo systemctl enable sddm.service

# Install an SDDM theme
paru -S sddm-theme-sugar-candy

# Create SDDM configuration directory
sudo mkdir -p /etc/sddm.conf.d

# Create SDDM configuration file
sudo tee /etc/sddm.conf.d/sddm.conf >/dev/null <<EOF
[Theme]
Current=sugar-candy

[General]
DisplayServer=wayland
GreeterEnvironment=QT_WAYLAND_SHELL_INTEGRATION=layer-shell

[Wayland]
EnableHiDPI=true
SessionDir=/usr/share/wayland-sessions
EOF
