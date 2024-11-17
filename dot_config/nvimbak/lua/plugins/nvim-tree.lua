local nvim_tree = utils.loadpkg("nvim-tree")
if nvim_tree == nil then
    return
end

local nvim_tree_config = utils.loadpkg("nvim-tree.config")
if nvim_tree_config == nil then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},

	--   renderer = {
	--     add_trailing = false,
	--     group_empty = false,
	--     highlight_git = false,
	--     full_name = false,
	--     highlight_opened_files = "none",
	--     root_folder_label = ":~:s?$?/..?",
	--     indent_width = 2,
	--     indent_markers = {
	--       enable = false,
	--       inline_arrows = true,
	--       icons = {
	--         corner = "└",
	--         edge = "│",
	--         item = "│",
	--         bottom = "─",
	--         none = " ",
	--       },
	--     },
	-- }
	renderer = {
		root_folder_modifier = ":t",
		group_empty = true,
		highlight_git = true,
		indent_width = 2,
		indent_markers = {
			inline_arrows = true,
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = "",
			},
		},
		icons = {
			-- webdev_colors = true,
			padding = " ",
			git_placement = "after",
			show = {
				file = false,
				folder = true,
				folder_arrow = false,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "⚠",
			error = "",
		},
	},
	view = {
		width = 30,
		adaptive_size = true,
		side = "right",
		-- mappings = {
		-- 	list = {
				-- { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				-- { key = "h", cb = tree_cb("close_node") },
				-- { key = "-", cb = tree_cb("hsplit") },
				-- { key = "=", cb = tree_cb("split") },
			-- },
		-- },
	},
	-- ignore_buffer_on_setup = true,
})
