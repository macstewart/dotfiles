local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	return
end

copilot.setup({
	suggestion = {
		enabled = true,
		keymap = {
			accept = "<C-Tab>",
			dismiss = "<C-e>",
			next = "<C-q>",
		},
	},
	panel = { enabled = false },
	cmp = {
		enabled = true,
		method = "getCompletionsCycling",
	},
	ft_disable = { "markdown" },
	-- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
	server_opts_overrides = {
		-- trace = "verbose",
		settings = {
			advanced = {
				-- listCount = 10, -- #completions for panel
				inlineSuggestCount = 5, -- #completions for getCompletions
			},
		},
	},
})
