#!/usr/bin/env zsh
# ================================================
# ZSH OPTIONS
# ================================================

# ===== DIRECTORY NAVIGATION =====
setopt AUTO_CD                # cd by typing directory name
setopt AUTO_PUSHD             # Push directories onto stack
setopt PUSHD_IGNORE_DUPS      # Don't push duplicates
setopt PUSHD_SILENT           # Don't print stack after pushd/popd
setopt PUSHD_TO_HOME          # pushd with no args goes to ~

# ===== COMPLETION =====
setopt ALWAYS_TO_END          # Move cursor to end after completion
setopt AUTO_MENU              # Show completion menu on tab
setopt AUTO_LIST              # Automatically list choices
setopt COMPLETE_IN_WORD       # Complete from both ends
setopt MENU_COMPLETE          # Insert first match immediately

# ===== CORRECTION =====
setopt CORRECT                # Suggest command corrections
setopt CORRECT_ALL            # Suggest corrections for arguments too (disable if annoying)

# ===== GLOBBING =====
setopt EXTENDED_GLOB          # Use extended globbing (**, ^, ~)
setopt GLOB_DOTS              # Include hidden files in globs
setopt NO_CASE_GLOB           # Case insensitive globbing
setopt NUMERIC_GLOB_SORT      # Sort globs numerically

# ===== GENERAL =====
setopt INTERACTIVE_COMMENTS   # Allow comments in interactive shell
setopt NO_BEEP                # Don't beep on errors
setopt MULTIOS                # Enable multiple redirections
setopt PROMPT_SUBST           # Allow substitution in prompts

# ===== JOB CONTROL =====
setopt LONG_LIST_JOBS         # List jobs in long format
setopt NOTIFY                 # Report status of background jobs immediately
