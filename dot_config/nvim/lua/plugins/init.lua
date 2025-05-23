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

  {
    "nvim-java/nvim-java",
    ft = "java",
    -- dependencies = {
    --   "nvim-java/lua-async-await",
    --   "nvim-java/nvim-java-core",
    --   "nvim-java/nvim-java-test",
    --   "nvim-java/nvim-java-dap",
    --   "MunifTanjim/nui.nvim",
    --   "neovim/nvim-lspconfig",
    --   "mfussenegger/nvim-dap",
    --   {
    --     "williamboman/mason.nvim",
    --     opts = {
    --       registries = {
    --         "github:nvim-java/mason-registry",
    --         "github:mason-org/mason-registry",
    --       },
    --     },
    --   },
    -- },
    -- config = function()
    --   require("java").setup {}
    --   require("lspconfig").jdtls.setup {
    --     on_attach = require("nvchad.configs.lspconfig").on_attach,
    --     capabilities = require("nvchad.configs.lspconfig").capabilities,
    --     filetypes = { "java" },
    --   }
    -- end,
  },
}
