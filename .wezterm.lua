-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


config.initial_cols = 80
--config.initial_rows = 36
config.initial_rows = 28


-- FONT
config.font_size = 14
--config.font = wezterm.font('CommitMono', { weight = 'Regular', italic = false })
--config.font = wezterm.font 'CommitMono'
--config.font = wezterm.font 'JetBrains Mono'
--config.font = wezterm.font 'GeistMono Nerd Font' --rounded
--config.font = wezterm.font 'DepartureMono Nerd Font' --pixelated
config.font = wezterm.font 'RecMonoLinear Nerd Font'
--config.font = wezterm.font 'RecMonoCasual Nerd Font' --more comic sans like



-- THEME

--config.color_scheme = 'AdventureTime'
--config.color_scheme = 'Tomorrow Night Blue'

-- Root Loops color schemes
-- via https://rootloops.sh

-- sugar:9, artificial:10, sogginess:10, intense, Plum, just a splash
local IntensePlumDark = {
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

-- sugar:5, artificial:10, sogginess:1, intense, orange, go all in
local IntenseOrangeLight = {
  foreground = "#3f3833",
  background = "#f2f0ef",
  cursor_bg = "#726860",
  cursor_border = "#26211e",
  cursor_fg = "#f2f0ef",
  selection_bg = "#3f3833",
  selection_fg = "#f2f0ef",
  ansi = {
    "#e6e2de",
    "#cc0f00",
    "#00833b",
    "#856900",
    "#3c4dff",
    "#b300ad",
    "#007b8a",
    "#726860"
  },
  brights = {
    "#b4a9a1",
    "#f41400",
    "#009e48",
    "#a17f00",
    "#5674ff",
    "#d700d0",
    "#0095a7",
    "#26211e"
  },
}

-- sugar:7, artificial:10, sogginess:0, classic, blueberry, no milk
ClassicBlueberryDark = {
  foreground = "#e2e2e2",
  background = "#080808",
  cursor_bg = "#b9b9b9",
  cursor_border = "#f1f1f1",
  cursor_fg = "#080808",
  selection_bg = "#e2e2e2",
  selection_fg = "#080808",
  ansi = {
    "#222222",
    "#ff506e",
    "#5cb200",
    "#cc8a00",
    "#4699ff",
    "#d057ff",
    "#00afaf",
    "#b9b9b9"
  },
  brights = {
    "#525252",
    "#ff828f",
    "#6aca00",
    "#e79d00",
    "#73b1ff",
    "#da84ff",
    "#00c7c7",
    "#f1f1f1"
  },
}

local appearance_themes = {
  Light = IntenseOrangeLight,
  --Dark = IntensePlumDark,
  Dark = ClassicBlueberryDark,
}
config.colors = appearance_themes[wezterm.gui.get_appearance()] or dark_theme


-- Finally, return the configuration to wezterm:
return config
