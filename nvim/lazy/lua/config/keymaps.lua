local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", "<C-c>", "<cmd>noh<CR>")
map("n", ";", ":")
map("n", "<leader>s", "<cmd>source %<CR>")
map("n", "<leader><CR>", "<cmd>.lua<CR>")

map("i", "jj", "<Esc>")
map("i", "<C-l>", "<right>")
map("i", "<C-h>", "<left>")
map("i", "<C-a>", "<Home>")
map("i", "<C-e>", "<End>")

map("v", "<leader><CR>", ":lua<CR>")

-- TODO: Add QuickFix List Mappings - https://www.youtube.com/watch?v=wOdL2T4hANk
-- TODO: Telescope Mappings

-- TODO: Customize Oil.nvim keymaps
-- map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- Source - https://stackoverflow.com/a
-- Posted by Kyle F. Hartzenberg, modified by community. See post 'Timeline' for change history
-- Retrieved 2025-11-16, License - CC BY-SA 4.0

-- TODO: too simple, improve later
-- quick jump to next & previous diagnostic
map("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
