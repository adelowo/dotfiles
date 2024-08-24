local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Darcula (base16)"
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font("Jetbrains Mono")
config.font_size = 20

return config
