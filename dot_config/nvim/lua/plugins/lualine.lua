local lualine = utils.loadpkg("lualine")
if lualine == nil then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    always_visible = false,
}
local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
}

local filetype = {
    "filetype",
    icons_enabled = false,
}

local location = {
    "location",
    padding = { left = 0, right = 1 },
}

-- local spaces = function()
-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

lualine.setup({
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { diagnostics },
        lualine_x = { diff, "encoding", filetype },
        lualine_y = { location },
        lualine_z = { "progress", "searchcount" },
    },
    extensions = { "nvim-tree", "toggleterm" },
})
