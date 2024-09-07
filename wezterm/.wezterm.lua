local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Darcula (base16)"
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font("Monaspace Radon")
config.font_size = 22

return config
