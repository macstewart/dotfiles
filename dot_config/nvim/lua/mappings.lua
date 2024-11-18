require "nvchad.mappings"

local map = vim.keymap.set
local clear = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })

-- nvimtree
map("n", "\\\\", ":NvimTreeFindFile<CR>")
clear("n", "<C-n>") --nvim tree toggle
map("n", "\\p", ":NvimTreeToggle<CR>")

-- lazy keys weren't working here for some reason so we need to define them here
-- and use the cmd trigger instead
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

clear("n", "<Tab>") --buffer next
map("n", "<S-L>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

clear("n", "<S-Tab>") --buffer prev
map("n", "<S-H>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

-- Telescope
clear("n", "<leader>fw")
map("n", "<leader>ft", ":Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find recent" })

-- formatting
map("n", "<leader>lf", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "reset git hunk" })

map("n", "<leader>jq", function()
  require("utils").Next_quickfix_item()
end, { desc = "next quickfix" })
map("n", "<leader>kq", function()
  require("utils").Prev_quickfix_item()
end, { desc = "next quickfix" })
map("n", "<leader>jk", "<cmd>cp<CR>", { desc = "prev quickfix" })
map("n", "\\q", ":ccl<cr>:lcl<cr>", { desc = "toggle quickfix" })

map("n", "<C-S-p>", ":echo 'csp works!'<cr>")
map("n", "<T-p>", ":echo  'tp works!'<cr>")
map("n", "<M-p>", ":echo  'mp works!'<cr>")
map("n", "<A-p>", ":echo  'ap works!'<cr>")
map("n", "<D-p>", ":echo  'dp works!'<cr>")
