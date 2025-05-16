-- Load default keymap from $XDG_DATA_HOME/nvim/lazy/NvChad/lua/nvchad/mappings.lua
require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-c>", "<cmd>noh<CR>", { desc = "nohighlight" })

map("i", "jj", "<Esc>")
