#!/bin/bash

# Optional: ask before removal
PROMPT=true   # set to false to auto-remove without prompt

# You can switch between yay and pacman here
PKG_MGR="yay"  # change to "pacman" if you don't use yay

remove_pkg() {
  local pkg="$1"

  # Check if package is installed
  if pacman -Q "$pkg" &>/dev/null; then
    echo "📦 '$pkg' is installed."

    if $PROMPT; then
      read -p "→ Do you want to remove '$pkg'? [y/N] " answer
      if [[ "$answer" =~ ^[Yy]$ ]]; then
        sudo "$PKG_MGR" -Rns "$pkg"
      else
        echo "❎ Skipped '$pkg'"
      fi
    else
      sudo "$PKG_MGR" -Rns "$pkg"
    fi
  else
    echo "✅ '$pkg' is not installed."
  fi
}

# No package passed
if [[ $# -eq 0 ]]; then
  echo "❗ Usage: $0 <package1> <package2> ..."
  exit 1
fi

# Loop through all packages
for pkg in "$@"; do
  remove_pkg "$pkg"
done

