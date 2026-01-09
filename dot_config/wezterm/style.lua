local wezterm = require("wezterm")
require("util/statusline/segment")
require("util/color")
local sep = ""
local rev_sep = ""
local scheme = wezterm.get_builtin_color_schemes()["Catppuccin Latte"]

StyleConfig = {
	font = wezterm.font("FiraCode Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),
	font_size = 13.0,

	color_scheme = "Tokyo Night (Gogh)", -- or Macchiato, Frappe, Latte
	use_fancy_tab_bar = false,
	-- inactive_pane_hsb = { saturation = 0.6, brightness = 0.4 },
	show_new_tab_button_in_tab_bar = false,
	-- window_frame = {
	-- 	border_left_width = "0.2cell",
		-- border_right_width = "0.2cell",
		-- border_bottom_height = "0.2cell",
		-- border_top_height = "0.1cell",
		-- border_left_color = "green",
		-- border_right_color = "green",
		-- border_bottom_color = "green",
	-- 	border_top_color = "green",
	-- },
	inactive_pane_hsb = {
		saturation = 0.5,
		brightness = 0.5,
	},
	active_pane_hsb = {
		saturation = 0.5,
		brightness = 0.5,
	},
}
