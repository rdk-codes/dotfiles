-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14

config.enable_tab_bar = false

config.colors = {
  foreground = "#e0def4",
  background = "#08080f", -- your custom override
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
    "#6e6a86", -- black
    "#eb6f92", -- red
    "#31748f", -- green
    "#f6c177", -- yellow
    "#9ccfd8", -- blue
    "#c4a7e7", -- magenta
    "#ebbcba", -- cyan
    "#e0def4", -- white
  },
}
config.window_padding = {
  left = '2cell',
  right = '2cell',
  top = '1cell',
  bottom = '0.62cell',
}
config.window_decorations = "NONE"
config.window_background_opacity = 0.9
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 600

-- and finally, return the configuration to wezterm
return config

