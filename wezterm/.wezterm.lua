local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Kanagawa (Gogh)"

config.font = wezterm.font("Monaspace Radon")
config.font_size = 16

return config
