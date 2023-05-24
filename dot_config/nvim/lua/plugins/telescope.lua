local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },

		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
				["<C-t>"] = trouble.open_with_trouble,
				["<C-->"] = actions.select_vertical,
				["<C-=>"] = actions.select_horizontal,
				["<C-/>"] = "which_key",
			},
			n = {
				["-"] = actions.select_vertical,
				["="] = actions.select_horizontal,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
				["<C-t>"] = trouble.open_with_trouble,
				["<C-/>"] = "which_key",
				["?"] = "which_key",
			},
		},
	},
})
