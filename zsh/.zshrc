# ===== 1. Set ZSH Theme (BEFORE plugins) =====
# ZSH_THEME="powerlevel10k/powerlevel10k"  # Example (replace with your theme)
ZSH_THEME="robbyrussell"  # Example (replace with your theme)

# ===== 2. Source Helper Scripts (aliases, paths, etc.) =====
source $XDG_CONFIG_HOME/zsh/scripts/alias.sh
source $XDG_CONFIG_HOME/zsh/scripts/path.sh
# source $XDG_CONFIG_HOME/zsh/scripts/tools.sh
source $XDG_CONFIG_HOME/zsh/scripts/vimode.sh
source $XDG_CONFIG_HOME/zsh/scripts/tmux.sh
source $XDG_CONFIG_HOME/zsh/scripts/utils.sh
# source $XDG_CONFIG_HOME/zsh/scripts/restart.sh

# source ~/.fzf.zsh                # fzf keybindings/completion
[ -f $XDG_CONFIG_HOME/zsh/.fzf.zsh ] && source $XDG_CONFIG_HOME/zsh/.fzf.zsh

# Enable vi-mode indicator
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

# Then load plugins
# ===== 3. Configure Oh My Zsh Plugins =====
plugins=(
  sudo
  git            # Git shortcuts (gst, gco, etc.)
  vi-mode        # Vim keybindings (ESC for Normal mode)
  zsh-autosuggestions  # Command suggestions (requires manual install)
  zsh-syntax-highlighting  # Colorful syntax (requires manual install)
)

# ===== 4. Load Oh My Zsh =====
source $ZSH/oh-my-zsh.sh

# ===== 5. Post-Load Config (e.g., vi-mode settings) =====
# Reduce ESC delay in vi-mode
export KEYTIMEOUT=0

# Add this to ~/.zshrc
# function zle-line-init zle-keymap-select {
#   case $KEYMAP in
#     vicmd)      VI_MODE="%F{red}[N]%f" ;;  # Normal mode
#     viins|main) VI_MODE="%F{green}[I]%f" ;; # Insert mode
#   esac
#   PROMPT='${VI_MODE} %B%F{blue}%~%f%b %# '  # Update prompt
#   zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# ff
# Add at the very end of .zshrc
bindkey '^R' fzf-history-widget
export TERM=xterm-kitty
