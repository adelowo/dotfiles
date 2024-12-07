local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.color_scheme = "Kanagawa (Gogh)"
config.color_scheme = "Kanagawa Dragon (Gogh)"
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font("Monaspace Radon")
config.font_size = 20

return config
