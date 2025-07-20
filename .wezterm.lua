-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


-- LAYOUT

--config.initial_cols = 80
--config.initial_rows = 28
config.initial_cols = 92
config.initial_rows = 32

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
--config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	--left = 26px,
	--right = 26px,
	--top = 20px,
	--bottom = 20px,
	left = '2cell',
	right = '2cell',
	top = '1cell',
	bottom = '1cell',
}


-- BEHAVIOUR

config.hide_mouse_cursor_when_typing = false


-- FONT
config.font_size = 14
--config.font = wezterm.font('CommitMono', { weight = 'Regular', italic = false })
--config.font = wezterm.font 'JetBrains Mono'
--config.font = wezterm.font 'DepartureMono Nerd Font' --pixelated
--config.font = wezterm.font('RecMonoLinear Nerd Font', { weight = 'Bold', italic = false })
config.font = wezterm.font 'RecMonoLinear Nerd Font'
--config.font = wezterm.font 'RecMonoCasual Nerd Font' --more comic sans like
--config.font = wezterm.font 'BerkeleyMonoTrial'


-- THEME

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
local selectedTheme = appearance_themes[wezterm.gui.get_appearance()] --select according to system light/dark mode
config.colors = selectedTheme or dark_theme

local windowFrameColor = selectedTheme.brights[8]
--local windowFrameColor = selectedTheme.foreground
config.window_frame = {
	border_left_width = '0.3cell',
	border_right_width = '0.3cell',
	border_bottom_height = '0.15cell',
	border_top_height = '0.15cell',
	border_left_color = windowFrameColor,
	border_right_color = windowFrameColor,
	border_bottom_color = windowFrameColor,
	border_top_color = windowFrameColor,
	active_titlebar_bg = windowFrameColor,
	active_titlebar_fg = selectedTheme.cursor_fg,
	--inactive_titlebar_bg = windowFrameColor,
	--inactive_titlebar_fg = selectedTheme.background,
	--active_titlebar_border_bottom = selectedTheme.ansi[4],
	--inactive_titlebar_border_bottom = selectedTheme.ansi[5],
	--button_fg = selectedTheme.ansi[4],
	--button_bg = selectedTheme.ansi[3],
	--button_hover_fg = '#ffffff',
	--button_hover_bg = '#3b3052',
}


-- KEYS

config.keys = {
	{ key = '1', mods = 'ALT', action = wezterm.action.ActivateTab(0) },
	{ key = '2', mods = 'ALT', action = wezterm.action.ActivateTab(1) },
	{ key = '3', mods = 'ALT', action = wezterm.action.ActivateTab(2) },
	{ key = '4', mods = 'ALT', action = wezterm.action.ActivateTab(3) },
	{ key = '5', mods = 'ALT', action = wezterm.action.ActivateTab(4) },
	{ key = '6', mods = 'ALT', action = wezterm.action.ActivateTab(5) },
	{ key = '7', mods = 'ALT', action = wezterm.action.ActivateTab(6) },
	{ key = '8', mods = 'ALT', action = wezterm.action.ActivateTab(7) },
	{ key = '9', mods = 'ALT', action = wezterm.action.ActivateTab(8) },
	{ key = '0', mods = 'ALT', action = wezterm.action.ActivateTab(9) },
}


-- Finally, return the configuration to wezterm:
return config
