#!/usr/bin/env zsh
# ================================================
# PATH CONFIGURATION
# ================================================

# ===== LOCAL BINARIES =====
export PATH="$HOME/.local/bin:$PATH"

# ===== GO BINARIES =====
export PATH="$HOME/go/bin:$PATH"

# ===== PNPM =====
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ===== CUSTOM SCRIPTS =====
export PATH="$HOME/dotfiles/zsh/scripts:$PATH"

# ===== RUST/CARGO (if installed) =====
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
