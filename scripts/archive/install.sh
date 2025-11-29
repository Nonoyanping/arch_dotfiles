#!/usr/bin/env bash
set -euo pipefail

# ---------------------------------------------
# 🎯 Arch Linux Bootstrap Script (Interactive)
# ---------------------------------------------
echo "🛠️  Welcome to your Arch Bootstrap Assistant"
echo "📌 This script assumes:"
echo "  1. You ran: sudo pacman -Syu"
echo "  2. You installed: git, base-devel"
echo "  3. You cloned this repo: git clone ..."
echo ""

confirm() {
  if command -v gum &>/dev/null; then
    gum confirm "$1"
  else
    read -p "$1 [y/N]: " answer
    [[ "$answer" == [Yy]* ]]
  fi
}

if ! confirm "✅ Are these requirements met and you're ready to begin?"; then
  echo "❌ Please complete the prerequisites and run this script again."
  exit 1
fi

# ---------------------------------------------
# 🌐 Step 1: Update system
# ---------------------------------------------
echo "🔄 Updating system..."
sudo pacman -Syu --noconfirm

# ---------------------------------------------
# 📦 Step 2: Install yay
# ---------------------------------------------
if ! command -v yay &>/dev/null; then
  echo "📦 Installing yay from AUR..."
  rm -rf /tmp/yay
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  (cd /tmp/yay && makepkg -si --noconfirm)
else
  echo "✔️  yay is already installed"
fi

# ---------------------------------------------
# 🧩 Step 3: Package Groups
# ---------------------------------------------
cli_core=(fzf gum)
cli_tools=(
  eza fastfetch fd ripgrep lazygit 
  tldr zoxide btop bat 
  tree tmux chezmoi
  # jq yq gh gping procs delta dust xplr nnn httpie glow tealdeer starship gitui direnv atuin watchexec entr just cheat
)

general_tools=(google-chrome obsidian zoom spotify gimp discord obs-studio)
editor_tools=(neovim helix emacs zed jetbrains-toolbox visual-studio-code-bin)
# language_tools=(goenv pyenv poetry zig)
terminals=(alacritty ghostty kitty wezterm)
fallback_fonts=(noto-fonts noto-fonts-cjk noto-fonts-emoji)
nerd_fonts=(
  ttf-meslo-nerd
  ttf-hack-nerd
  ttf-jetbrains-mono-nerd
  ttf-firacode-nerd
  ttf-dejavu-nerd
  ttf-cascadia-mono-nerd
  ttf-cascadia-code-nerd
  ttf-roboto-mono-nerd
  ttf-sourcecodepro-nerd
  ttf-victor-mono-nerd
)

# 🧠 fcitx5 variants will be selected interactively later

shell_tools=(zsh)

# ---------------------------------------------
# 🔧 Step 4: Install Logic
# ---------------------------------------------
is_outdated_aur() {
  yay -Si "$1" 2>/dev/null | grep -q "Out-of-date:"
}

install_if_needed() {
  local pkg="$1"
  if yay -Q "$pkg" &>/dev/null; then
    echo "✔️  $pkg is already installed"
  elif is_outdated_aur "$pkg"; then
    confirm "⚠️  $pkg is out-of-date. Install anyway?" \
      && yay -S --noconfirm "$pkg" \
      || echo "⏭️  Skipping $pkg"
  else
    echo "📦 Installing $pkg..."
    yay -S --noconfirm "$pkg"
  fi
}

install_many() {
  for pkg in "$@"; do install_if_needed "$pkg"; done
}

run_section() {
  local title="$1"
  shift
  local pkgs=("$@")
  echo -e "\n🧩 $title"
  confirm "Install $title?" && install_many "${pkgs[@]}"
}

# ---------------------------------------------
# 🚀 Step 5: Install All
# ---------------------------------------------
run_section "Core CLI Tools" "${cli_core[@]}"
run_section "Extra CLI Tools" "${cli_tools[@]}"
run_section "Editors" "${editor_tools[@]}"
# run_section "Language Toolchains" "${language_tools[@]}"
run_section "Terminals" "${terminals[@]}"
run_section "Fallback Fonts (Noto)" "${fallback_fonts[@]}"
run_section "Nerd Fonts (Your Pick)" "${nerd_fonts[@]}"

echo "🌀 Updating font cache..."
fc-cache -fv

# ---------------------------------------------
# ⌨️ Step 6: Input Method Setup
# ---------------------------------------------

# ---------------------------------------------
# 🐚 Zsh + Oh-My-Zsh
# ---------------------------------------------
echo -e "\n🐚 Zsh + Oh-My-Zsh Setup"
if confirm "Install and configure Zsh + Oh-My-Zsh?"; then
  install_many "${shell_tools[@]}"
  if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
  fi

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    export RUNZSH=no
    export CHSH=no
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
  [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] \
    && git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# ---------------------------------------------
# ✅ Final Step: Reboot
# ---------------------------------------------
echo -e "\n✅ All Done!"
echo "🪄 Your Arch system is now supercharged."

if confirm "🔁 Reboot now to finalize setup?"; then
  reboot
else
  echo "👍 You can reboot later manually."
fi
