return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    -- keys aren't working for some reason
    -- at least <c-l> wasn't working
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "java",
        "sql",
        "json"
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = {},
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeFindFile" },
  },

  {
    "nanotee/sqls.nvim",
    ft = "sql",
    -- config = function()
      -- vim.bo.commentstring = '-- %s';
    -- end,
  },

}
