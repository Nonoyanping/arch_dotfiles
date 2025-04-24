#!/usr/bin/zsh
# WIP -> Use Chezmoi instead in future

set -e

DOTFILES_DIR="$HOME/dotfiles" # Adjust if your dotfiles dir is elsewhere
echo "Linking dotfiles from $DOTFILES_DIR..."

configs_files=(
	alacritty wezterm kitty 
	emacs helix
	git tmux zsh
	asdf
)

for config in "${configs_files[@]}"; do
	src="$DOTFILES_DIR/$config"
	dest="$XDG_CONFIG_HOME/$config"
	[ -L "$dest" ] && rm "$dest"         # If symlink, remove
	[ -d "$dest" ] && rm -rf "$dest"     # If directory, remove it (be careful!)
	echo "Linking $src → $dest"
	ln -sfv "$src" "$dest"
done
## Alacritty
# ln -sfv "$DOTFILES_DIR/alacritty/" "$XDG_CONFIG_HOME/alacritty"

## Emacs
# ln -sfv "$DOTFILES_DIR/emacs" "$XDG_CONFIG_HOME/emacs"


# FZF
# link "$DOTFILES_DIR/fzf" "$HOME/.config/fzf"

## Git
# link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig" # or create subfiles like ~/.config/git/config
# ln -sfv "$DOTFILES_DIR/git" "$XDG_CONFIG_HOME/git"

## Helix
# ln -sfv "$DOTFILES_DIR/helix/" "$XDG_CONFIG_HOME/helix"

## Kitty
# ln -sfv "$DOTFILES_DIR/kitty/" "$XDG_CONFIG_HOME/kitty"

# Neovim (NvChad, kickstart, etc. - customize this as needed)
# link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Templates
# link "$DOTFILES_DIR/templates" "$HOME/.config/templates"

## Tmux
# ln -sfv "$DOTFILES_DIR/tmux" "$XDG_CONFIG_HOME/tmux"

## WezTerm
# ln -sfv "$DOTFILES_DIR/wezterm" "$XDG_CONFIG_HOME/wezterm"

# Zsh
# link "$DOTFILES_DIR/zsh/" "$HOME/.zshrc" # or customize path

# link "$DOTFILES_DIR/zsh/alias.zsh" "$HOME/.config/zsh/alias.zsh"
# link "$DOTFILES_DIR/zsh/navi.zsh" "$HOME/.config/zsh/navi.zsh"
# link "$DOTFILES_DIR/zsh/path.zsh" "$HOME/.config/zsh/path.zsh"

# Bash
# link "$DOTFILES_DIR/bash" "$HOME/.bashrc" # or customize path

echo "✅ Dotfiles linked successfully!"
