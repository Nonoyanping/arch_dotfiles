# 🔄 Neovim Config Switcher (Multi-Distro Setup)

This is a modular Neovim environment manager that lets you switch between different Neovim distributions (like LazyVim, NvChad, kickstart.nvim) while keeping each config fully isolated — including plugin data, state, and cache.

---

## ✨ Features

- 📦 Isolated runtime folders (`share/`, `state/`, `cache/`) for each config
- 🔗 Symlinks to `~/.config/nvim`, `~/.local/share/nvim`, etc.
- 🧹 No plugin conflicts between configs
- ⚡ Fast switching — no plugin reinstallation
- 🔁 Automatically syncs plugins (`:Lazy sync`, `:NvChadUpdate`)
- 🔍 `fzf`-based interactive selector with config previews

---

## 📁 Folder Structure

```text
dotfiles/nvim/
├── lazy/              # LazyVim config
├── nvchad/            # NvChad config
├── kickstart/         # kickstart.nvim
├── runtimes/          # Stores plugin & cache per config
├── switch.sh          # Interactive switcher
└── README.md

