return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
		opts = {
			provider = "lllmClaudev2", -- Recommend using Claude
			-- WARNING: Since auto-suggestions are a high-frequency operation and therefore expensive,
			-- currently designating it as `copilot` provider is dangerous because: https://github.com/yetone/avante.nvim/issues/1048
			-- Of course, you can reduce the request frequency by increasing `suggestion.debounce`.
			auto_suggestions_provider = "lllmClaudeHaiku",
			behaviour = {
				auto_suggestions = false,
			},
			vendors = {
				lllmClaudev2 = {
					__inherited_from = "openai",
					endpoint = "https://lite-llm.mymaas.net",
					model = "claude-3-7-sonnet",
					api_key_name = "LITELLM_API_KEY",
					temperature = 0,
					max_tokens = 4096,
				},
				lllmClaudeHaiku = {
					__inherited_from = "openai",
					endpoint = "https://lite-llm.mymaas.net",
					model = "bedrock-anthropic-claude-3-haiku",
					api_key_name = "LITELLM_API_KEY",
					temperature = 0,
					max_tokens = 4096,
				},
			},
			-- add any opts here
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
