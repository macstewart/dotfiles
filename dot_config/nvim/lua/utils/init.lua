M = {}

M.Next_quickfix_item = function()
    local success, _ = pcall(function() vim.cmd("cnext") end)
    if not success then
        vim.cmd("cfirst")
        print("Wrapped to first quickfix item")
    end
end

M.Prev_quickfix_item = function()
    local success, _ = pcall(function() vim.cmd("cprevious") end)
    if not success then
        vim.cmd("clast")
        print("Wrapped to last quickfix item")
    end
end

return M
