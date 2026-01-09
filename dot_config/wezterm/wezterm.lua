require("style")
-- require("nvimPanes")
require("wezmap")
require("handlers")

local config = {
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 0,
	},
	tab_max_width = 2000,
	window_background_opacity = 0.95,
	-- window_decorations = "INTEGRATED_BUTTONS | RESIZE | MACOS_FORCE_DISABLE_SHADOW",
	window_decorations = "RESIZE | MACOS_FORCE_DISABLE_SHADOW",
	-- enable_tab_bar = true,
	scrollback_lines = 5000,
	enable_scroll_bar = false,
	check_for_updates = true,
	adjust_window_size_when_changing_font_size = false,
	-- hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	enable_tab_bar = false,
	enable_kitty_keyboard = true,
	enable_csi_u_key_encoding = true,
	audible_bell = "Disabled",
  front_end = "WebGpu",
  max_fps = 240,
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = true,
}

local function addConfig(moduleConfig)
	for i, v in pairs(moduleConfig) do
		config[i] = v
	end
end

addConfig(StyleConfig)
addConfig(KeyConfig)
return config
