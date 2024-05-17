local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Batman"

config.font = wezterm.font("Monaspace Radon")
config.font_size = 16

return config
