-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


-- LAYOUT

--config.initial_cols = 80
--config.initial_rows = 28
config.initial_cols = 96
config.initial_rows = 32

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
--config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = '2cell',
	right = '2cell',
	top = '1cell',
	bottom = '1cell',
}


-- BEHAVIOUR

config.hide_mouse_cursor_when_typing = false


-- FONT
-- 420 HELLO 1Il 0O8B ([{ != && |> =>
--config.font = wezterm.font 'CommitMono Nerd Font'
--config.font = wezterm.font 'JetBrains Mono'
--config.font = wezterm.font('RecMonoLinear Nerd Font', {weight = 'Bold', italic = false})
--config.font = wezterm.font 'RecMonoLinear Nerd Font'
--config.font = wezterm.font 'AtkinsonHyperlegibleMono'
--config.cell_width = 0.90
--config.font = wezterm.font 'VictorMono'
--config.font = wezterm.font('VictorMono', {weight='Bold'})
--config.font = wezterm.font 'Adwaita Mono'
--config.font = wezterm.font 'Sans Forgetica'
--config.font = wezterm.font 'OpenDyslexicMono'

--config.font_size = 14
--config.line_height = 1.0
--config.font = wezterm.font 'BerkeleyMonoTrial'

--config.font_size = 14
--config.line_height = 1.1
--config.font = wezterm.font 'RecMonoCasual Nerd Font' --more comic sans like

--config.font_size = 15
--config.font = wezterm.font 'Iosevka'

config.font_size = 13
--config.font_size = 24 -- for 80 char width in vim fullscreen
--config.line_height = 1.05 --for square checkerboard patterns
config.line_height = 1.1
config.font = wezterm.font '0xProto Nerd Font'

--config.font_size = 16
--config.line_height = 1.0
--config.font = wezterm.font('Terminess Nerd Font Mono', {weight='Regular'})


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

-- sugar:5, artificial:8, sogginess:4, intense, orange, go all in
local IntensePlumLight = {
  foreground = "#243d4e",
  background = "#eaf2f8",
  cursor_bg = "#486f8b",
  cursor_border = "#142430",
  cursor_fg = "#eaf2f8",
  selection_bg = "#243d4e",
  selection_fg = "#eaf2f8",
  ansi = {
    "#d5e5f1",
    "#b54032",
    "#377e4a",
    "#836a1e",
    "#4760d1",
    "#a92da4",
    "#207a87",
    "#486f8b"
  },
  brights = {
    "#87b1d0",
    "#d65342",
    "#43985a",
    "#9e8026",
    "#5e7ae5",
    "#c644bf",
    "#2993a3",
    "#142430"
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
local ClassicBlueberryDark = {
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

-- sugar:5, artificial:8, sogginess:4, intense, blueberry, go all in
local IntenseBlueberryLight = {
  foreground = "#223f44",
  background = "#e6f4f6",
  cursor_bg = "#44737b",
  cursor_border = "#122629",
  cursor_fg = "#e6f4f6",
  selection_bg = "#223f44",
  selection_fg = "#e6f4f6",
  ansi = {
    "#cde8ed",
    "#b54032",
    "#377e4a",
    "#836a1e",
    "#4760d1",
    "#a92da4",
    "#207a87",
    "#44737b"
  },
  brights = {
    "#7db7c1",
    "#d65342",
    "#43985a",
    "#9e8026",
    "#5e7ae5",
    "#c644bf",
    "#2993a3",
    "#122629"
  },
}

local IntenseKiwiLight = {
	foreground = "#353c36",
	background = "#eff1ef",
	cursor_bg = "#646d65",
	cursor_border = "#1f2420",
	cursor_fg = "#eff1ef",
	selection_bg = "#353c36",
	selection_fg = "#eff1ef",
	ansi = {
		"#dfe4e0",
		"#b54032",
		"#377e4a",
		"#836a1e",
		"#4760d1",
		"#a92da4",
		"#207a87",
		"#646d65"
	},
	brights = {
		"#a4afa6",
		"#d65342",
		"#43985a",
		"#9e8026",
		"#5e7ae5",
		"#c644bf",
		"#2993a3",
		"#1f2420"
	},
}

local white1 = "f2f2f2"
local black1 = "111111"
local gray1 = "76787a"
local green1 = "2daa72"
local yellow1 = "e7bf4d"
local blue1 = "6482f4" --"6d70d8"
local red1 = "b8444e"
local customDark = {
	background = black1,
	foreground = white1, --text
	cursor_bg = red1,
	cursor_border = black1,
	cursor_fg = white1,
	selection_bg = white1,
	selection_fg = black1,
	ansi = {
		black1,
		yellow1, --values
		green1, --language keywords
		yellow1, --tmux scrolling, distrobox non running containers
		blue1, --comments
		green1, --macros, escape chars, cwd in shell
		white1, --function names
		gray1 --line numbers
	},
	brights = {
		gray1,
		red1, --red
		yellow1, --executable files
		red1, --vim autocomplete highlight
		green1, --directories
		white1,
		blue1, --soft links
		white1
	},
}

local black2 = black1
local white2 = "f8f8f8"
local gray2 = "adb4ba"
local green2 = "289a68"
local yellow2 = "deab2a"
local blue2 = "4b64d3" --"5d61d1"
local red2 = red1
local customLight = {
	background = white2,
	foreground = black2,
	cursor_bg = red2,
	cursor_border = white2,
	cursor_fg = white2,
	selection_bg = black2,
	selection_fg = white2,
	ansi = {
		white2,
		yellow2, --values
		green2, --language keywords
		yellow2, --tmux scrolling, distrobox non running containers
		blue2, --comments
		green2, --macros, escape chars, cwd in shell
		black2, --function names
		gray2 --line numbers
	},
	brights = {
		gray2,
		red2, --red
		yellow2, --executable files
		red2, --vim autocomplete highlight
		green2, --directories
		black2,
		blue2, --soft links
		black2
	},
}

local appearance_themes = {
	--Light = IntenseOrangeLight,
	--Light = IntensePlumLight,
	--Dark = IntensePlumDark,
	--Dark = ClassicBlueberryDark,
	--Light = IntenseBlueberryLight,
	--Light = IntenseKiwiLight,
	Light = customLight,
	Dark = customDark
}
local selectedTheme = appearance_themes[wezterm.gui.get_appearance()] --select according to system light/dark mode
config.colors = selectedTheme or dark_theme

--local windowFrameColor = selectedTheme.background
local windowFrameColor = "edeeef"
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
