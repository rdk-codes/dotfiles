-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder and wezterm.config_builder() or {}

-- Appearance
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16
config.enable_tab_bar = false
config.window_background_opacity = 0.96
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 600
config.window_close_confirmation = "NeverPrompt"

-- Color Scheme (Rosé Pine)
config.colors = {
	foreground = "#e0def4",
	background = "#121017", -- this controls terminal background
	cursor_bg = "#e0def4",
	cursor_border = "#e0def4",
	cursor_fg = "#191724",
	selection_bg = "#403d52",
	selection_fg = "#e0def4",
	ansi = {
		"#26233a", -- black
		"#eb6f92", -- red
		"#31748f", -- green
		"#f6c177", -- yellow
		"#9ccfd8", -- blue
		"#c4a7e7", -- magenta
		"#ebbcba", -- cyan
		"#e0def4", -- white
	},
	brights = {
		"#6e6a86", -- bright black
		"#eb6f92", -- bright red
		"#31748f", -- bright green
		"#f6c177", -- bright yellow
		"#9ccfd8", -- bright blue
		"#c4a7e7", -- bright magenta
		"#ebbcba", -- bright cyan
		"#e0def4", -- bright white
	},
}

config.window_decorations = "NONE"
config.window_padding = {
	left = 32,
	right = 32,
	top = 32,
	bottom = 32,
}

return config
