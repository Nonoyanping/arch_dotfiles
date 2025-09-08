local opt = vim.opt
local o = vim.o
local g = vim.g

o.clipboard = "unnamedplus"

opt.list = true
opt.listchars = "tab:│·,space:·"
opt.termguicolors = true
-- opt.colorcolumn = "93"

o.tabstop = 4 -- Number of spaces a Tab character represents
o.shiftwidth = 4 -- Number of spaces used for (auto)indent
o.expandtab = true -- Convert Tab characters to spaces
o.softtabstop = 4 -- Number of spaces for a Tab when 'expandtab' is set
