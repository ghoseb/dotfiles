local wezterm = require("wezterm")

local config = {
	check_for_updates = false,
	initial_rows = 35,
	initial_cols = 125,
	color_scheme = "Modus-Vivendi-Tinted", -- 'Gotham (Gogh)',
	font = wezterm.font("IosevkaTermSlab NFM"),
	font_size = 18,
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	launch_menu = {},
	enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_padding = { left = "1cell", right = "1cell", top = "0.5cell", bottom = "0.5cell" },

	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	window_background_opacity = 0.97,
	macos_window_background_blur = 10,
}

return config
