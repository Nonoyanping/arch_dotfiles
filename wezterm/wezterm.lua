local wezterm = require("wezterm")

local fonts = require("modules.font")
local theme = require("modules.theme")

local config = {}

config.automatically_reload_config = true

-- Spawn a fish shell in login mode
config.default_prog = { "/usr/bin/zsh", "-l" }

config.color_scheme = theme
config.font = wezterm.font(fonts)

return config
