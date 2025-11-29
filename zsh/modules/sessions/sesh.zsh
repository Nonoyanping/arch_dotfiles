#!/usr/bin/env zsh
# Enhanced Sesh session manager integration

# Check if sesh exists
command -v sesh >/dev/null 2>&1 || return

# Prevent double-init
[[ -v SESH_INITED ]] && return
SESH_INITED=1

# ===== ENHANCED SESH FUNCTIONS =====

# Main launcher with full features (matches tmux binding)
sesh-launcher() {
  local selected
  selected=$(sesh list --icons --hide-duplicates | fzf \
    --height 100% \
    --reverse \
    --no-border \
    --list-border \
    --input-border \
    --header-border \
    --prompt '⚡  ' \
    --pointer '▶' \
    --marker '✓' \
    --header '  ^a all ^t tmux ^g configs ^x zoxide ^d kill ^f find' \
    --bind 'tab:down,btab:up' \
    --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
    --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
    --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
    --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
    --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
    --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
    --preview-window 'right:70%' \
    --preview 'sesh preview {}')
  
  [[ -z $selected ]] && return
  sesh connect "$selected"
}

# Popup launcher (works inside tmux)
sesh-popup() {
  if [[ -n $TMUX ]]; then
    # Inside tmux - use popup
    tmux display-popup -E -w 100% -h 100% "sesh connect \"\$(sesh list --icons --hide-duplicates | fzf \
      --height 100% \
      --reverse \
      --no-border \
      --list-border \
      --input-border \
      --header-border \
      --prompt '⚡  ' \
      --pointer '▶' \
      --marker '✓' \
      --header '  ^a all ^t tmux ^g configs ^x zoxide ^d kill ^f find' \
      --bind 'tab:down,btab:up' \
      --bind 'ctrl-b:abort' \
      --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
      --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
      --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
      --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
      --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
      --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
      --preview-window 'right:70%' \
      --preview 'sesh preview {}')\""
  else
    # Outside tmux - regular launcher
    sesh-launcher
  fi
}

# Create session from current directory
sesh-here() {
  local session_name=$(basename "$PWD" | tr . _)
  
  if tmux has-session -t "$session_name" 2>/dev/null; then
    sesh connect "$session_name"
  else
    sesh connect "$session_name"
  fi
}

# Kill session with picker
sesh-kill() {
  local selected
  selected=$(tmux list-sessions -F "#{session_name}" | fzf \
    --height 40% \
    --reverse \
    --border-label ' kill session ' \
    --prompt '🗑️  ')
  
  [[ -z $selected ]] && return
  
  echo -n "Kill session '$selected'? [y/N] "
  read -r response
  [[ $response =~ ^[Yy]$ ]] && tmux kill-session -t "$selected"
}

# Rename current session
sesh-rename() {
  [[ -z $TMUX ]] && echo "Not in tmux session" && return
  
  local current_session=$(tmux display-message -p '#S')
  echo -n "New name for '$current_session': "
  read -r new_name
  
  [[ -n $new_name ]] && tmux rename-session -t "$current_session" "$new_name"
}

# Show session info
sesh-info() {
  echo "󰋽 Sesh Session Info"
  echo "───────────────────"
  echo "Current session: $(tmux display-message -p '#S' 2>/dev/null || echo 'Not in tmux')"
  echo "Root directory: $(sesh root 2>/dev/null || echo 'N/A')"
  echo ""
  echo " All sessions:"
  sesh list -t -c --icons
}

# Session with root filter
sesh-root() {
  local selected
  selected=$(sesh list --icons | fzf \
    --query "$(sesh root 2>/dev/null || echo '')" \
    --height 100% \
    --reverse \
    --no-border \
    --list-border \
    --input-border \
    --prompt '  ' \
    --header 'Sessions in current project root' \
    --bind 'tab:down,btab:up' \
    --preview-window 'right:70%' \
    --preview 'sesh preview {}')
  
  [[ -z $selected ]] && return
  sesh connect "$selected"
}

# ===== ALIASES =====
alias s='sesh-popup'              # Quick launcher (full featured)
alias ss='sesh-launcher'          # Regular launcher
alias sh='sesh-here'              # Create from current dir
alias sk='sesh-kill'              # Kill session
alias sr='sesh-rename'            # Rename session
alias si='sesh-info'              # Session info
alias sR='sesh-root'              # Root filter
alias sl='sesh list --icons'      # List all

# Specific listings
alias slt='sesh list -t --icons'  # Tmux sessions only
alias slc='sesh list -c --icons'  # Config sessions only
alias slz='sesh list -z --icons'  # Zoxide directories only

# ===== ZLE WIDGET =====
# Allows binding to keyboard shortcut
sesh-widget() {
  sesh-popup
  zle reset-prompt
}
zle -N sesh-widget

# Bind to Ctrl-Space
bindkey '^@' sesh-widget

# ===== SMART SESSION STARTUP =====
# Show available sessions when opening terminal (non-intrusive)
if [[ -z $TMUX ]] && [[ -n $PS1 ]]; then
  if command -v tmux >/dev/null 2>&1; then
    if tmux list-sessions 2>/dev/null | grep -q .; then
      echo "󰭎 Available sessions:"
      sesh list -t -c --icons --hide-duplicates | head -5
      echo ""
      echo " Press Ctrl-Space for full session picker"
    fi
  fi
fi
