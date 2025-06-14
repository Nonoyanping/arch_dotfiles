local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", "<C-c>", "<cmd>noh<CR>")
map("n", "<leader>s", "<cmd>source %<CR>")
map("n", "<leader><CR>", "<cmd>.lua<CR>")

map("i", "jj", "<Esc>")
map("i", "<C-f>", "<right>")
map("i", "<C-b>", "<left>")
map("i", "<C-h>", "<Home>")
map("i", "<C-l>", "<End>")

map("v", "<leader><CR>", ":lua<CR>")
