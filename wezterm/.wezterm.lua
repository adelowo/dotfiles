local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Kanagawa Dragon (Gogh)"
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font({
	family = "Berkeley Mono",
	weight = "Bold",
})

-- normal workdesk scene because of monitors
-- disable if working on mac
config.font_size = 20

--  twitch/YT scene
-- config.font_size = 24

return config
