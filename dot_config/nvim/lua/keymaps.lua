local keymap = vim.keymap.set
-- local opts = { silent = true }
local opts = {}
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "<leader><esc>", "<cmd>nohlsearch<cr>", opts)
keymap("n", "<leader><F5>", ":source $MYVIMRC<cr>", opts)

keymap("n", "-", "$", opts)
keymap("n", "<leader>a", "$", opts)
keymap("n", "<leader>i", "0", opts)
keymap("v", "<leader>a", "$", opts)
keymap("v", "<leader>i", "0", opts)

keymap("n", "<a-j>", ":m .+1<CR>==")
keymap("n", "<a-k>", ":m .-2<CR>==")
keymap("i", "<a-j>", "<Esc>:m .+1<CR>==gi")
keymap("i", "<a-k>", "<Esc>:m .-2<CR>==gi")
keymap("v", "<a-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<a-k>", ":m '<-2<CR>gv=gv")

keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts)
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts)
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts)

keymap("n", "<leader>o", '@="m`o<C-V><Esc>``"<CR>')
-- break line at cursor
keymap("n", "<leader>j", "i<cr><esc>l", opts)

keymap("n", "<M-k>", ":m -2<CR>", opts)
keymap("n", "<M-j>", ":m +1<CR>", opts)
keymap("x", "<m-k>", ":m '<-2<cr>gv=gv", opts)
keymap("x", "<m-j>", ":m '>+1<cr>gv=gv", opts)

-- resize with arrows
keymap("n", "<m-up>", ":resize -2<cr>", opts)
keymap("n", "<m-down>", ":resize +2<cr>", opts)
keymap("n", "<m-left>", ":vertical resize -2<cr>", opts)
keymap("n", "<m-right>", ":vertical resize +2<cr>", opts)

-- splits
keymap("n", "<leader>-", "<cmd>split<cr>", opts)
keymap("n", "<leader>=", "<cmd>vsplit<cr>", opts)

-- navigate buffers
keymap("n", "<s-h>", ":BufferLineCyclePrev<cr>", opts)
keymap("n", "<s-l>", ":BufferLineCycleNext<cr>", opts)

keymap("n", "<s-Left>", ":BufferLineMovePrev<cr>", opts)
keymap("n", "<s-Right>", ":BufferLineMoveNext<cr>", opts)

keymap("n", "<C-1>", "<cmd>BufferLineGoToBuffer 1<cr>", opts)
keymap("n", "<C-2>", "<cmd>BufferLineGoToBuffer 2<cr>", opts)
keymap("n", "<C-3>", "<cmd>BufferLineGoToBuffer 3<cr>", opts)
keymap("n", "<C-4>", "<cmd>BufferLineGoToBuffer 4<cr>", opts)
keymap("n", "<C-5>", "<cmd>BufferLineGoToBuffer 5<cr>", opts)
keymap("n", "<C-6>", "<cmd>BufferLineGoToBuffer 6<cr>", opts)
keymap("n", "<C-7>", "<cmd>BufferLineGoToBuffer 7<cr>", opts)
keymap("n", "<C-8>", "<cmd>BufferLineGoToBuffer 8<cr>", opts)
keymap("n", "<C-9>", "<cmd>BufferLineGoToBuffer 9<cr>", opts)

keymap("n", "<leader>h", ":lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "\\h", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap("n", "<leader>5", ":lua require('harpoon.ui').nav_file(5)<cr>", opts)
keymap("n", "<leader>6", ":lua require('harpoon.ui').nav_file(6)<cr>", opts)
keymap("n", "<leader>7", ":lua require('harpoon.ui').nav_file(7)<cr>", opts)
keymap("n", "<leader>8", ":lua require('harpoon.ui').nav_file(8)<cr>", opts)
keymap("n", "<leader>9", ":lua require('harpoon.ui').nav_file(9)<cr>", opts)
keymap("n", "<leader><tab>", ":e#<cr>", opts)
-- close buffers
keymap("n", "<leader>ww", "<cmd>Bdelete!<cr>", opts)
keymap("n", "<leader>wo", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<cr>", opts)
-- close to the right
keymap("n", "<leader>wl", ":BufferLineCloseRight<cr>", opts)
-- close to the left
keymap("n", "<leader>wh", ":BufferLineCloseLeft<cr>", opts)
--unsplit
keymap("n", "<leader>x", "<cmd>close<cr>", opts)

--HOTSWAP CONFIG
keymap("n", "<leader>cw", ":set wrap!<cr>", opts)
keymap("n", "<leader>c#", ":set relativenumber!<cr>", opts)

-- clear highlights

-- better paste
keymap("v", "p", '"_dP', opts)

-- visual --
-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--PLUGINS
-- NvimTree
keymap("n", "\\\\", ":NvimTreeFindFile<CR>", opts)
keymap("n", "\\p", ":NvimTreeToggle<CR>", opts)
keymap("n", "\\t", ":TroubleToggle<cr>", opts)
keymap("n", "\\q", ":ccl<cr>:lcl<cr>", opts)

-- keymap("n", ";", ":", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fc", ":Telescope colorscheme<CR>", opts)

keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts)
keymap("n", "gr", ":Telescope lsp_references<CR>", opts)
keymap("n", "gI", ":Telescope lsp_implen<CR>", opts)

-- keymap("n", "<leader>hh", "<Plug>RestNvim", opts)
-- keymap("n", "<leader>hr", "<Plug>RestNvimLast", opts)
-- keymap("n", "<leader>hp", "<Plug>RestNvimPreview", opts)

-- GIT
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR>", opts)
keymap("n", "<leader>gh", ":Gitsigns toggle_linehl<CR>:Gitsigns toggle_numhl<CR>", opts)
keymap("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<CR>", opts)
keymap("n", "<leader>gb", "<cmd>lua require'gitsigns'.blame_line({full=true})<CR>", opts)
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts)
keymap("n", "<leader>gD", "<cmd>lua require'gitsigns'.diffthis('~')<CR>", opts)
-- Text object
keymap("o", "ig", ":<C-U>Gitsigns select_hunk<CR>")
keymap("x", "ig", ":<C-U>Gitsigns select_hunk<CR>")
keymap("n", "]g", "&diff ? ']c' : ':Gitsigns next_hunk<CR>'", { expr = true })
keymap("n", "[g", "&diff ? '[c' : ':Gitsigns prev_hunk<CR>'", { expr = true })

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- quickfix list
keymap("n", "]q", ":cn<cr>", opts)    -- next quickfix item
keymap("n", "[q", ":cp<cr>", opts)    -- previous quickfix item
keymap("n", "]Q", ":cnew<cr>", opts)  --next quickfix list
keymap("n", "[Q", ":col<cr>", opts)   --previous quickfix list
-- location list
keymap("n", "]l", ":lnext<cr>", opts) -- next location item
keymap("n", "[l", ":lp<cr>", opts)    -- previous location item
-- trouble list
keymap("n", "]t", "<cmd>lua require'trouble'.next({skip_groups = true, jump = true})<cr>", opts)
keymap("n", "[t", "<cmd>lua require'trouble'.previous({skip_groups = true, jump = true})<cr>", opts)
-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
