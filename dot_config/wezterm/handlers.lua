local wezterm = require("wezterm")

wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if window:is_focused() then
		overrides.window_frame = nil
		overrides.color_scheme = nil
	else
		overrides.color_scheme = '3024 Night (Gogh)'
	end
	window:set_config_overrides(overrides)
end)

return {}
-- local palettes = require("style/palette")
-- require("util/statusline/segment")
-- local statusline = require("util/statusline/statusline")
-- local mux = require("util/mux")

-- wezterm.on("update-status", function(w, p)
-- w:set_right_status(wezterm.format(statusline.buildRight(w, p)))
-- w:set_left_status(wezterm.format(statusline.buildLeft(w, p)))
-- end)

-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
-- 	if tab.is_active then
-- 		local render = statusline.buildActiveTab(tab, tabs)
--         return render
--     else
--         local render = statusline.buildInactiveTab(tab, tabs)
--         return render
-- 	end
-- end)
--
--
-- v
--
-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
-- return tab.is_active and "true" or "false"
-- end)
