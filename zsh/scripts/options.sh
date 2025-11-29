# ========== ZSH OPTIONS ==========
# General options
setopt AUTO_CD              # Auto change directory without 'cd'
setopt AUTO_PUSHD           # Push directories onto stack
setopt PUSHD_IGNORE_DUPS    # Don't push duplicate directories
setopt PUSHD_SILENT         # Don't print directory stack
setopt CORRECT              # Suggest corrections for commands
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell

# Globbing options
setopt EXTENDED_GLOB # Extended globbing (**, ^, ~, etc.)
setopt GLOB_DOTS     # Include hidden files in glob
setopt NO_CASE_GLOB  # Case insensitive globbing

# Completion options
setopt ALWAYS_TO_END    # Move cursor to end of word after completion
setopt AUTO_MENU        # Show completion menu on tab
setopt COMPLETE_IN_WORD # Complete from both ends of word
setopt MENU_COMPLETE    # Insert first match immediately
