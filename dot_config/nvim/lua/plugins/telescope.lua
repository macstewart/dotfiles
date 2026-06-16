return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local action_layout = require "telescope.actions.layout"

    opts.defaults = opts.defaults or {}
    opts.defaults.mappings = opts.defaults.mappings or {}
    opts.defaults.mappings.i = vim.tbl_extend("force", opts.defaults.mappings.i or {}, {
      ["<C-k>"] = action_layout.toggle_preview,
    })
    opts.defaults.mappings.n = vim.tbl_extend("force", opts.defaults.mappings.n or {}, {
      ["<C-k>"] = action_layout.toggle_preview,
    })

    opts.pickers = opts.pickers or {}
    opts.pickers.find_files = vim.tbl_extend("force", opts.pickers.find_files or {}, {
      previewer = false,
    })

    return opts
  end,
}
