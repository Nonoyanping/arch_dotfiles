#!/usr/bin/env zsh
# ================================================
# CLEAN ZSH CONFIGURATION
# ================================================
# Auto-loads all modules from modules/ directory
# XDG environment variables are set in ~/.zshenv

# ===== PERFORMANCE PROFILING (OPTIONAL) =====
# Uncomment to profile startup time
# zmodload zsh/zprof

# ===== AUTO-LOAD ALL MODULES =====
# This automatically sources all .zsh files in modules/
for module_file in $XDG_CONFIG_HOME/zsh/modules/**/*.zsh(N); do
  source "$module_file"
done

# ===== COMPLETION SYSTEM =====
# Load completion system
autoload -Uz compinit

# Only regenerate compdump once per day
if [[ -n $XDG_CACHE_HOME/zsh/zcompdump(#qN.mh+24) ]]; then
  compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
else
  compinit -C -d "$XDG_CACHE_HOME/zsh/zcompdump"
fi

# Completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:warnings' format 'No matches found'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

# ===== EXTERNAL TOOLS =====
# NVM (Node Version Manager)
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

# Wikiman
[[ -f /usr/share/wikiman/widgets/widget.zsh ]] && source /usr/share/wikiman/widgets/widget.zsh

# ===== PERFORMANCE PROFILING OUTPUT =====
# Uncomment if you enabled profiling at the top
# zprof
