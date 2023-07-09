local catppuccin = utils.loadpkg("catppuccin")
if catppuccin == nil then
    return
end
catppuccin.setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {  -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    term_colors = true,
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = { "bold" },
        operators = {},
    },
    color_overrides = {
        mocha = {
            -- base = "#1e1e2e",
        },
    },
    custom_highlights = function(colors)
        return {
            Comment = { fg = colors.flamingo },
            CursorLine = { style = { "underline" } },
            ["@constant.builtin"] = { fg = colors.peach, style = {} },
            ["@comment"] = { fg = colors.surface2, style = { "italic" } },
        }
    end,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        dap = true,
        mason = true,
        which_key = true,
        markdown = true,
    },
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
