local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Kanagawa Dragon (Gogh)"
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font({
	-- Berkely mono. Font was stored as TX-02 after download/purchase
	-- too lazy to rename
	family = "TX-02",
	-- weight = "Bold",
})
config.font_size = 22

return config
