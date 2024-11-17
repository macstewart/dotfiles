local telescope = utils.loadpkg("telescope")
if telescope == nil then
    return
end

local actions = require("telescope.actions")
local trouble_ts = require("trouble.sources.telescope")

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
                ["<C-t>"] = trouble_ts.open,
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
                ["<C-t>"] = trouble_ts.open,
                ["t"] = trouble_ts.open,
                ["<C-/>"] = "which_key",
                ["?"] = "which_key",
            },
        },
    },
})
telescope.load_extension("lsp_handlers")
