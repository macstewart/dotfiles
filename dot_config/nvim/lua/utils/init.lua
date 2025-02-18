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

M.Async_format = function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end

return M
