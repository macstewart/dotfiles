local bufferline = utils.loadpkg("bufferline")
if bufferline == nil then
    return
end

local mocha = require("catppuccin.palettes").get_palette("mocha")
bufferline.setup({
    options = {
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        separator_style = "thick",     -- | "thick" | "thin" | { 'any', 'any' },
        indicator = {
            style = "underline",
        },
    },

    highlights = require("catppuccin.groups.integrations.bufferline").get({
        styles = { "italic", "bold" },
        custom = {
            all = {
                -- fill = { fg = mocha.text },
                buffer_selected = { bg = mocha.base },
                tab_selected = { bg = mocha.base },
                close_button_selected = { bg = mocha.base },
                numbers_selected = { bg = mocha.base },
                modified_selected = { bg = mocha.base },
                diagnostic_selected = { bg = mocha.base },
                hint_selected = { bg = mocha.base },
                info_selected = { bg = mocha.base },
                warning_selected = { bg = mocha.base },
                error_selected = { bg = mocha.base },
                separator_selected = { bg = mocha.base },
                indicator_selected = { bg = mocha.base },
            },
            mocha = {
                background = { fg = mocha.text },
            },
            latte = {
                background = { fg = "#000000" },
            },
        },
    }),
    -- highlights = {
    --   fill = {
    --     fg = { attribute = "fg", highlight = "#ff0000" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --
    --   background = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --
    --   buffer_visible = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --
    --   close_button = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   close_button_visible = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   tab_selected = {
    --     fg = { attribute = "fg", highlight = "Normal" },
    --     bg = { attribute = "bg", highlight = "Normal" },
    --   },
    --
    --   tab = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --
    --   tab_close = {
    --     -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
    --     fg = { attribute = "fg", highlight = "TabLineSel" },
    --     bg = { attribute = "bg", highlight = "Normal" },
    --   },
    --
    --   duplicate_selected = {
    --     fg = { attribute = "fg", highlight = "TabLineSel" },
    --     bg = { attribute = "bg", highlight = "TabLineSel" },
    --     italic = true,
    --   },
    --
    --   duplicate_visible = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --     italic = true,
    --   },
    --
    --   duplicate = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --     italic = true,
    --   },
    --
    --   modified = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --
    --   modified_selected = {
    --     fg = { attribute = "fg", highlight = "Normal" },
    --     bg = { attribute = "bg", highlight = "Normal" },
    --   },
    --
    --   modified_visible = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --
    --   separator = {
    --     fg = { attribute = "bg", highlight = "TabLine" },
    --     bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --
    --   separator_selected = {
    --     fg = { attribute = "bg", highlight = "Normal" },
    --     bg = { attribute = "bg", highlight = "Normal" },
    --   },
    --
    --   indicator_selected = {
    --     fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
    --     bg = { attribute = "bg", highlight = "Normal" },
    --   },
    -- },
})
