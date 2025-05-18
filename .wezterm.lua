local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Appearance
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.enable_tab_bar = false
config.font_size = 16
config.window_background_opacity = 0.85
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 600

-- Color Scheme (Rosé Pine manually set)
config.colors = {
  foreground = "#e0def4",
  background = "#08080f",
  cursor_bg = "#e0def4",
  cursor_border = "#e0def4",
  cursor_fg = "#191724",
  selection_bg = "#403d52",
  selection_fg = "#e0def4",
  ansi = {
    "#26233a", "#eb6f92", "#31748f", "#f6c177",
    "#9ccfd8", "#c4a7e7", "#ebbcba", "#e0def4",
  },
  brights = {
    "#6e6a86", "#eb6f92", "#31748f", "#f6c177",
    "#9ccfd8", "#c4a7e7", "#ebbcba", "#e0def4",
  },
}

-- Static pixel padding
config.window_padding = {
  left = "32px",
  right = "32px",
  top = "32px",
  bottom = "18px",
}

return config

