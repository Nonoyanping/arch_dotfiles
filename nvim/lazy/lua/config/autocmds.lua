-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.kbd",
  command = "set filetype=lisp",
})

-- 1. Set the default state
vim.g.transparent_bg_enabled = true

-- 2. Define the function that applies transparency
local function apply_transparency()
  if vim.g.transparent_bg_enabled then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
  end
end

-- 3. Create the autocommand group
local augroup = vim.api.nvim_create_augroup("TransparentBackground", { clear = true })

-- 4. Autocommand for *subsequent* theme changes (like :colorscheme foo)
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  group = augroup,
  callback = apply_transparency,
})

-- 5. (THE FIX) Autocommand for the *very first* theme load on startup
--    VimEnter runs *after* LazyVim loads all plugins and sets the theme.
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  group = augroup,
  callback = apply_transparency,
  once = true, -- We only need this to run one time on startup
})

-- 6. Create the user command to toggle the state
vim.api.nvim_create_user_command("ToggleTransparency", function()
  -- Flip the global variable
  vim.g.transparent_bg_enabled = not vim.g.transparent_bg_enabled

  -- Reload the current colorscheme to apply the change
  local current_colorscheme = vim.g.colors_name
  if current_colorscheme then
    vim.cmd.colorscheme(current_colorscheme)
  end

  if vim.g.transparent_bg_enabled then
    print("Transparency enabled")
  else
    print("Transparency disabled")
  end
end, {})

-- Default: txt and md files -> read-only
local function set_readonly()
  -- List of filetypes to auto-lock
  local readonly_filetypes = {
    txt = true,
    markdown = true,
    help = true,
    -- Add more: 'json', 'yaml', 'gitcommit', etc.
  }

  if readonly_filetypes[vim.bo.filetype] then
    vim.bo.modifiable = false
    vim.bo.readonly = true
    -- Optional: visual cue
    vim.api.nvim_echo({ { "🔒 Read-only mode (toggle with <leader>ro)", "WarningMsg" } }, true, {})
  end
end

-- Apply on BufRead, but not for new/empty buffers
vim.api.nvim_create_autocmd("BufRead", {
  callback = set_readonly,
})
