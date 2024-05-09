local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Batman"

-- and finally, return the configuration to wezterm
config.font = wezterm.font("Fira Code")
-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
-- config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })
return config
