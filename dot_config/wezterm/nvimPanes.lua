local wezterm = require("wezterm")

local move_around = function(window, pane, direction_wez, direction_nvim)
	local result = os.execute(
		"env NVIM_LISTEN_ADDRESS=/tmp/nvim"
			.. pane:pane_id()
			.. " "
			.. wezterm.home_dir
			.. "/utils/wezterm.nvim.navigator "
			.. direction_nvim
	)
	if result then
		window:perform_action(wezterm.action({ SendString = "\x17" .. direction_nvim }), pane)
	else
		window:perform_action(wezterm.action({ ActivatePaneDirection = direction_wez }), pane)
	end
end
wezterm.on("move-left", function(window, pane)
    move_around(window, pane, "Left", "h")
end)

wezterm.on("move-right", function(window, pane)
    move_around(window, pane, "Right", "l")
end)

wezterm.on("move-up", function(window, pane)
    move_around(window, pane, "Up", "k")
end)
wezterm.on("move-down", function(window, pane)

    move_around(window, pane, "Down", "j")
end)
