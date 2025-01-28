require "nvchad.options"

-- add yours here!

local o = vim.o
o.relativenumber = true
o.wrap = false
local api = vim.api
api.nvim_set_var("tmux_navigator_save_on_switch", 1)
api.nvim_set_var("tmux_navigator_no_wrap", 1)
api.nvim_set_var("tmux_navigator_disable_netrw_workaround", 1)

vim.opt.laststatus = 3

api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("FixSqlCommentstring", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "-- %s"
  end,
  pattern = { "sql" },
})
