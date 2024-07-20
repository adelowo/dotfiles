local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Kanagawa (Gogh)"

config.font = wezterm.font("Jetbrains Mono")
config.font_size = 20

return config
