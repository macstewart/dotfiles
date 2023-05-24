local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

keymap("n", "<F12>", ":w<CR>:exec '!go run .'<CR>", opts)
keymap("n", "<leader>li", ":GoImport<CR>", opts)
