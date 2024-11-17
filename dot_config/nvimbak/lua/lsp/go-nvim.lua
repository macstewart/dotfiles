require("go").setup({
    dap_debug_vt = { enabled_commands = false, all_frames = false }, -- bool|table put your dap-virtual-text setup here set to false to disable
})

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require("go.format").goimport()
    end,
    group = format_sync_grp,
})
