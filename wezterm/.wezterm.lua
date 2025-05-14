-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


config.initial_cols = 80
--config.initial_rows = 36
config.initial_rows = 28


-- FONT
config.font_size = 14
--config.font = wezterm.font 'JetBrains Mono'
config.font = wezterm.font 'CommitMono'


-- THEME

--config.color_scheme = 'AdventureTime'
--config.color_scheme = 'Tomorrow Night Blue'

-- Root Loops color scheme
-- sugar:9, artificial:10, sogginess:10, intense, Plum, just a splash
-- via https://rootloops.sh
config.colors = {
  foreground = "#d9efff",
  background = "#00253b",
  cursor_bg = "#8ccfff",
  cursor_border = "#eff8ff",
  cursor_fg = "#00253b",
  selection_bg = "#d9efff",
  selection_fg = "#00253b",
  ansi = {
    "#003e5f",
    "#ffab9d",
    "#00ea6e",
    "#eebd00",
    "#adc2ff",
    "#ff9af7",
    "#00dcf6",
    "#8ccfff"
  },
  brights = {
    "#0072a8",
    "#ffccc3",
    "#5aff8d",
    "#ffd65e",
    "#ccd9ff",
    "#ffc4f9",
    "#83edff",
    "#eff8ff"
  },
}


-- Finally, return the configuration to wezterm:
return config
