-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

	hl_override = {
		-- base46 defaults (black2 / base01) are nearly indistinguishable from the bg
		CursorLine = { bg = "one_bg3" },
		CursorColumn = { bg = "one_bg3" },
		CursorLineNr = { fg = "yellow", bold = true },
	},
}

return M
