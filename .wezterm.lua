-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


-- LAYOUT

--config.initial_cols = 80
--config.initial_rows = 28
config.initial_cols = 96
config.initial_rows = 32

--config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_decorations = "NONE"
--config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = '2cell',
	right = '2cell',
	top = '1cell',
	bottom = '1cell',
}


-- BEHAVIOUR

--config.enable_scroll_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_mouse_cursor_when_typing = false


-- FONT
-- 420 HELLO 1Il 0O8B ([{ != && |> =>

--config.font_size = 14
--config.line_height = 1.0
--config.font = wezterm.font 'BerkeleyMonoTrial'

-- https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/Iosevka.zip
--config.font_size = 15
--config.font = wezterm.font 'Iosevka'

-- https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/0xProto.zip
--config.font_size = 13
----config.font_size = 24 -- for 80 char width in vim fullscreen
----config.line_height = 1.05 --for square checkerboard patterns
--config.line_height = 1.1
--config.font = wezterm.font '0xProto Nerd Font'

-- https://github.com/tywr/Nordwand-Mono/releases/download/1.3.0/NordwandMono-OTF.zip
config.font_size = 14
config.font = wezterm.font 'Nordwand Mono'

-- THEME

local white_dark = "f2f2f2"
local black_dark = "111111"
local gray_dark = "76787a"
local green_dark = "2daa72"
local yellow_dark = "e7bf4d"
local blue_dark = "6482f4" --"6d70d8"
local red_dark = "b8444e"
local customDark = {
	background = black_dark,
	foreground = white_dark, --text
	cursor_bg = red_dark,
	cursor_border = black_dark,
	cursor_fg = white_dark,
	selection_bg = white_dark,
	selection_fg = black_dark,
	ansi = {
		black_dark,
		yellow_dark, --values
		green_dark, --language keywords
		yellow_dark, --tmux scrolling, distrobox non running containers
		blue_dark, --comments
		green_dark, --macros, escape chars, cwd in shell
		white_dark, --function names
		gray_dark --line numbers
	},
	brights = {
		gray_dark,
		red_dark, --red
		yellow_dark, --executable files
		red_dark, --vim autocomplete highlight
		green_dark, --directories
		white_dark,
		blue_dark, --soft links
		white_dark
	},
}

local black_light = black_dark
local white_light = "f8f8f8"
local gray_light = "adb4ba"
local green_light = "289a68"
local yellow_light = "deab2a"
local blue_light = "4b64d3" --"5d61d1"
local red_light = red_dark
local customLight = {
	background = white_light,
	foreground = black_light,
	cursor_bg = red_light,
	cursor_border = white_light,
	cursor_fg = white_light,
	selection_bg = black_light,
	selection_fg = white_light,
	ansi = {
		white_light,
		yellow_light, --values
		green_light, --language keywords
		yellow_light, --tmux scrolling, distrobox non running containers
		blue_light, --comments
		green_light, --macros, escape chars, cwd in shell
		black_light, --function names
		gray_light --line numbers
	},
	brights = {
		gray_light,
		red_light, --red
		yellow_light, --executable files
		red_light, --vim autocomplete highlight
		green_light, --directories
		black_light,
		blue_light, --soft links
		black_light
	},
	tab_bar = {
		background = white_light,
		--active_tab = {
		--	bg_color = gray_light,
		--	fg_color = white_light
		--},
		--inactive_tab = {
		--	bg_color = white_light,
		--	fg_color = black_light
		--},
		new_tab = {
			bg_color = white_light,
			fg_color = black_light
		}
	}
}

local appearance_themes = {
	Light = customLight,
	Dark = customDark
}
local selectedTheme = appearance_themes[wezterm.gui.get_appearance()] --select according to system light/dark mode
config.colors = selectedTheme

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

--config.window_background_opacity = 0.8
--config.wayland_window_background_blur = true


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
