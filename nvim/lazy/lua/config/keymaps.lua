local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", "<C-c>", "<cmd>noh<CR>")
map("n", "<leader>s", "<cmd>source %<CR>")
map("n", "<leader><CR>", "<cmd>.lua<CR>")

map("i", "jj", "<Esc>")
map("i", "<C-l>", "<right>")
map("i", "<C-h>", "<left>")
map("i", "<C-a>", "<Home>")
map("i", "<C-e>", "<End>")

map("v", "<leader><CR>", ":lua<CR>")

-- TODO: Add QuickFix List Mappings - https://www.youtube.com/watch?v=wOdL2T4hANk
