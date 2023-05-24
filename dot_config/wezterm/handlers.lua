-- local wezterm = require("wezterm")
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
