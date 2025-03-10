-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font_size = 16

config.enable_tab_bar = true

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- For example, changing the color scheme:
config.color_scheme = "Gruvbox dark, soft (base16)"
config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 16

config.window_decorations = "RESIZE"

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- and finally, return the configuration to wezterm
return config
