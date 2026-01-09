local wezterm = require("wezterm")
local act = wezterm.action

KeyConfig = {
	disable_default_key_bindings = true,
	keys = {

		-- { key = "A", mods = "CTRL", action = act.ActivateKeyTable({ name = "COMMAND", one_shot = false }) },
		-- { key = "a", mods = "CTRL", action = act.ActivateKeyTable({ name = "COMMAND", one_shot = true }) },
		-- { key = "Space", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },

		-- Turn off the default CMD-m Hide action, allowing CMD-m to
		-- { key = "_", mods = "CTRL|SHIFT", action = act.SplitVertical },
		-- { key = "+", mods = "CTRL|SHIFT", action = act.SplitHorizontal({}) },
		-- { key = "z", mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },
		--
		--

		{ key = "Space", mods = "CTRL", action = act.DisableDefaultAssignment },
		{ key = "=", mods = "CMD", action = act.IncreaseFontSize },
		{ key = "-", mods = "CMD", action = act.DecreaseFontSize },
		{ key = "0", mods = "CMD", action = act.ResetFontSize },
		{ key = "n", mods = "CMD", action = act.SpawnWindow },
		{ key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = false }) },
		{ key = "c", mods = "CMD", action = act.CopyTo 'ClipboardAndPrimarySelection' },
		{ key = "v", mods = "CMD", action = act.PasteFrom 'Clipboard' },
		-- { key = "p", mods = "CMD", action = act.SendString '\x02\"' },

		{
			key = "l",
			mods = "CMD",
			action = act.Multiple({
				act.ClearScrollback("ScrollbackAndViewport"),
				act.SendKey({ key = "L", mods = "CMD" }),
			}),
		},
		-- navigate panes
		-- { key = "h", mods = "CTRL", action = act({ EmitEvent = "move-left" }) },
		-- { key = "l", mods = "CTRL", action = act({ EmitEvent = "move-right" }) },
		-- { key = "k", mods = "CTRL", action = act({ EmitEvent = "move-up" }) },
		-- { key = "j", mods = "CTRL", action = act({ EmitEvent = "move-down" }) },

		-- { key = "x", mods = "CMD|SHIFT", action = act.CloseCurrentPane({ confirm = false }) },
		-- { key = "LeftArrow", mods = "CTRL|SHIFT", action = act.MoveTabRelative(-1) }, --move current tab left
		-- { key = "RightArrow", mods = "CTRL|SHIFT", action = act.MoveTabRelative(1) }, --move current tab right

		-- { key = "h", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) }, --switch to one tab left
		-- { key = "l", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) }, --one tab right
		-- { key = "Tab", mods = "CTRL", action = act.ActivateLastTab }, --switch to one tab left
		-- { key = "p", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette }, --one tab right, not GA yet (only on nightly)
	},
	key_tables = {
		COMMAND = {
			{ key = "n", action = act.ActivateKeyTable({ name = "CREATE", one_shot = true }) },
			{ key = "f", action = act.ActivateKeyTable({ name = "FIND", one_shot = true }) },
			{ key = "a", mods = "CTRL", action = act.ActivateKeyTable({ name = "COMMAND", one_shot = false }) },

			{ key = "-", action = act.SplitVertical },
			{ key = "=", action = act.SplitHorizontal({}) },

			{ key = "h", action = act({ EmitEvent = "move-left" }) },
			{ key = "l", action = act({ EmitEvent = "move-right" }) },
			{ key = "k", action = act({ EmitEvent = "move-up" }) },
			{ key = "j", action = act({ EmitEvent = "move-down" }) },

			{ key = "Tab", action = act.ActivateTabRelative(1) }, --switch to one tab left
			{ key = "Tab", mods = "SHIFT", action = act.ActivateTabRelative(-1) }, --switch to one tab left
			{ key = "1", action = act.ActivateTab(0) }, --switch to one tab left
			{ key = "2", action = act.ActivateTab(1) }, --switch to one tab left
			{ key = "3", action = act.ActivateTab(2) }, --switch to one tab left
			{ key = "4", action = act.ActivateTab(3) }, --switch to one tab left
			{ key = "5", action = act.ActivateTab(4) }, --switch to one tab left
			{ key = "6", action = act.ActivateTab(5) }, --switch to one tab left
			{ key = "7", action = act.ActivateTab(6) }, --switch to one tab left
			{ key = "8", action = act.ActivateTab(7) }, --switch to one tab left

			{ key = "x", action = act.CloseCurrentPane({ confirm = false }) },
			{ key = "w", action = act.CloseCurrentTab({ confirm = false }) },
			{ key = "d", action = act.ShowDebugOverlay },

			-- Cancel the mode by pressing escape
			{ key = "Escape", action = "ClearKeyTableStack" },
		},

		CREATE = {
			{ key = "t", action = act.SpawnTab("CurrentPaneDomain") },
			{ key = "w", action = act.SpawnWindow },
		},

		FIND = {
			{ key = "t", action = act.ShowTabNavigator },
			{ key = "p", action = act.PaneSelect },
			{ key = "p", mods = "SHIFT", action = act.PaneSelect({ mode = "SwapWithActive" }) },
		},
	},
}
