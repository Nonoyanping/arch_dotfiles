#!/usr/bin/zsh
set -euo pipefail

# =====================
# ARCH-LINUX SPECIFIC CONFIG
# =====================
# System directories to protect (Arch system config locations [6](@ref))
SYSTEM_NVIM_PATHS=(
  "/usr/share/nvim"
  "/usr/lib/nvim"
)

# =====================
# IMPROVEMENT 1: ARCH-FRIENDLY DEPENDENCY CHECKS
# =====================
function check_dependencies() {
  local missing=()
  (( $+commands[gum] )) || missing+=(gum)
  (( $+commands[realpath] )) || missing+=(coreutils)
  (( $+commands[btrfs] )) || missing+=(btrfs-progs)

  if (( ${#missing} > 0 )); then
    gum style --border="double" --border-foreground=196 \
      "⚠️  $(gum style --bold 'Missing Arch Packages:')" \
      "Install with:" \
      "$(gum style --foreground=87 "sudo pacman -S ${missing[@]}")"
    exit 127
  fi
}
check_dependencies

# =====================
# IMPROVEMENT 2: BTRFS SUBVOLUME SUPPORT
# =====================
function safe_dir_move() {
  local src=$1 dst=$2
  if findmnt -n -o FSTYPE "$dst" | grep -q btrfs; then
    gum spin --title="Creating Btrfs snapshot..." -- \
      sudo btrfs subvolume snapshot "$src" "$dst"
    sudo rm -rf "$src"
  else
    mv "$src" "$dst"
  fi
}

# =====================
# IMPROVEMENT 3: SYSTEM CONFIG PROTECTION
# =====================
function validate_paths() {
  for sys_path in $SYSTEM_NVIM_PATHS; do
    if [[ "$(realpath "$selected_config_path")" == "$sys_path"* ]]; then
      gum style --border="rounded" --border-foreground=196 \
        "❌ $(gum style --bold 'System Directory Protection!')" \
        "Modifying system configs in $sys_path is forbidden"
      exit 1
    fi
  done
}

# =====================
# IMPROVEMENT 4: PACMAN-STYLE PROGRESS INDICATORS
# =====================
function arch_spinner() {
  local frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
  gum spin --spinner.foreground=212 --spinner="${frames[@]}" "$@"
}

# =====================
# IMPROVEMENT 5: CONFIG DIFF VISUALIZATION
# =====================
function show_config_diff() {
  local old=$1 new=$2
  if (( $+commands[delta] )); then
    diff -u \
      <(grep '^use' "$CONFIG_BASE/$old/init.lua" 2>/dev/null) \
      <(grep '^use' "$CONFIG_BASE/$new/init.lua" 2>/dev/null) | delta --color-only
  else
    gum style --foreground=226 "Install 'delta' for enhanced diff views: yay -S delta"
  fi
}

# =====================
# MAIN EXECUTION FLOW
# =====================
# ... (rest of your original functions with above improvements integrated)
