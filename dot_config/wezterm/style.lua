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
}
