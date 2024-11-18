local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    -- print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local packer = utils.loadpkg("packer")
-- if packer == nil then
-- return
-- end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
    git = {
        clone_timeout = 300, -- Timeout, in seconds, for git clones
    },
})

return packer.startup(function(use)
    use({ "wbthomason/packer.nvim" })                                                    -- Have packer manage itself
    use({ "nvim-lua/plenary.nvim" })                                                     -- Useful lua functions used by lots of plugins
    use({ "windwp/nvim-autopairs" })                                                     -- Autopairs integrates with both cmp and treesitter
    use({ "numToStr/Comment.nvim" })                                                     -- adds comments textobjects and hotkeys
    use({ "JoosepAlviste/nvim-ts-context-commentstring" })                               --adds support for context sensitive comment blocks in certain languages
    use({ "nvim-tree/nvim-web-devicons" })                                               --devicons
    use({ "nvim-tree/nvim-tree.lua", commit = "ace64228ad5d89035fbe6f85e7f45a1f7b9e29c1" }) --file manager/file bar
    use({ "moll/vim-bbye" })                                                             --better buffer close behavior
    use({ "nvim-lualine/lualine.nvim" })                                                 --bottom status bar
    use({ "akinsho/toggleterm.nvim" })
    use({ "ahmedkhalf/project.nvim" })
    use({ "lewis6991/impatient.nvim" })
    use({ "lukas-reineke/indent-blankline.nvim" })
    use({ "goolord/alpha-nvim" })
    use({ "tpope/vim-surround" })
    use({ "tpope/vim-repeat" })
    use({ "christoomey/vim-tmux-navigator" })
    -- harpoon
    use({ "theprimeagen/harpoon" })

    -- use({ "junegunn/goyo.vim" })
    use({ "folke/zen-mode.nvim" })

    -- Style
    use({ "folke/tokyonight.nvim" })
    use({ "lunarvim/darkplus.nvim" })
    use({ "everblush/everblush.vim" })
    use({ "rafamadriz/neon" })
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "norcalli/nvim-colorizer.lua" })

    -- cmp plugins
    use({ "hrsh7th/nvim-cmp" })      -- The completion plugin
    use({ "hrsh7th/cmp-buffer" })    -- buffer completions
    use({ "hrsh7th/cmp-path" })      -- path completions
    use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-nvim-lua" })
    use({ "akinsho/bufferline.nvim" })
    use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
    -- snippets
    use({ "L3MON4D3/LuaSnip" })          --snippet engine
    use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

    -- LSP
    -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
    --
    use({ "OXY2DEV/markview.nvim" })
    use({
        "tadmccorkle/markdown.nvim",
        config = function()
            require("markdown").setup({
                -- configuration here or empty for defaults
            })
        end,
    })
    use("ray-x/go.nvim")
    use("ray-x/guihua.lua")       -- recommended if need floating window support
    use({ "mfussenegger/nvim-jdtls" })
    use({ "neovim/nvim-lspconfig" }) -- enable LSP
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
    use({ "RRethy/vim-illuminate" })
    use({ "imsnif/kdl.vim" })
    use({ "phelipetls/vim-jqplay" })
    -- Telescope
    use({ "nvim-telescope/telescope.nvim" })
    use({ "gbrlsnchs/telescope-lsp-handlers.nvim" })
    use({
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })
    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter" })
    use({ "nvim-treesitter/nvim-treesitter-textobjects" })

    -- Git
    use({ "lewis6991/gitsigns.nvim" })
    -- use({ "github/copilot.vim" })
    use({
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require("plugins.copilot")
            end, 100)
        end,
        use({
            "zbirenbaum/copilot-cmp",
            after = { "copilot.lua" },
            config = function()
                require("plugins.copilot-cmp")
            end,
        }),
    })
    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup()
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    })
    -- DAP
    use({ "mfussenegger/nvim-dap" })
    use({ "rcarriga/nvim-dap-ui" })
    use({ "ravenxrz/DAPInstall.nvim" })
    use("leoluz/nvim-dap-go")

    -- whichkey
    use({ "folke/which-key.nvim" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
