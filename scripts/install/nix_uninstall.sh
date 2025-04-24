#!/bin/bash

echo "🔧 Stopping nix-daemon if running..."
sudo systemctl stop nix-daemon.service nix-daemon.socket 2>/dev/null
sudo systemctl disable nix-daemon.service nix-daemon.socket 2>/dev/null
sudo systemctl unmask nix-daemon.service nix-daemon.socket 2>/dev/null
sudo systemctl daemon-reload

echo "🗑️ Removing systemd unit files..."
sudo rm -f /etc/systemd/system/nix-daemon.service
sudo rm -f /etc/systemd/system/nix-daemon.socket
sudo rm -f /etc/tmpfiles.d/nix-daemon.conf

echo "📂 Removing Nix files and directories..."
sudo rm -rf /nix /etc/nix /root/.nix* ~/.nix* ~/.cache/nix ~/.config/nix ~/.local/state/nix ~/.config/home-manager
sudo rm -rf /etc/zshrc.backup-before-nix
sudo rm -rf /etc/bashrc.backup-before-nix
sudo rm -rf /etc/bash.bashrc.backup-before-nix

echo "👥 Removing nixbld users and group..."
for i in $(seq 1 32); do
  sudo userdel nixbld$i 2>/dev/null
done
sudo groupdel nixbld 2>/dev/null

echo "🧽 Cleaning up shell config files..."
for file in /etc/bashrc /etc/bash.bashrc /etc/zshrc; do
  if [ -f "$file" ]; then
    sudo sed -i '/# Nix/,/# End Nix/d' "$file"
    echo "🧼 Cleaned $file"
  fi
done

echo "🗑️ Removing stray profile.d scripts..."
sudo rm -f /etc/profile.d/nix.sh 
sudo rm -f /etc/profile.d/nix.sh.backup-before-nix

echo "✅ Nix completely removed."
