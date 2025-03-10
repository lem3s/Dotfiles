local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
opts.desc = "Go to left pane"
keymap("n", "<C-h>", "<C-w>h", opts)
opts.desc = "Go to the pane below"
keymap("n", "<C-j>", "<C-w>j", opts)
opts.desc = "Go to the upper pane"
keymap("n", "<C-k>", "<C-w>k", opts)
opts.desc = "Go to the right pane"
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better far navigation
opts.desc = "Go to the beggining of the line"
keymap("n", "H", "I", opts)
opts.desc = "Go down 10 lines"
keymap("n", "J", "10j", opts)
opts.desc = "Go up 10 lines"
keymap("n", "K", "10k", opts)
opts.desc = "Go to the end of the line"
keymap("n", "L", "A", opts)

-- Clear search highlights
opts.desc = "Clear search highlights"
keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- Navigate buffers
opts.desc = "Go to next buffer"
keymap("n", "<leader>bn", ":bnext<CR>", opts)
opts.desc = "Go to previous buffer"
keymap("n", "<leader>bp", ":bprevious<CR>", opts)
opts.desc = "Close buffer"
keymap("n", "<leader>bx", ":bdelete<CR>", opts)

-- window management
opts.desc = "Split window vertically"
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
opts.desc = "Split window horizontally"
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
opts.desc = "Make windows equal width e height"
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
opts.desc = "Close current split window"
keymap("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-- keymap("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
-- keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
-- keymap("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
-- keymap("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Insert --
-- Press jk fast to enter
opts.desc = "when in insert mode, go to normal mode"
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
opts.desc = "Indent to left"
keymap("v", "<", "<gv", opts)

opts.desc = "Indent to right"
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
opts.desc = "Move text block up"
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
opts.desc = "Move text block down"
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
-- keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>fs", "<cmd>Telescope find_grep<cr>", opts) --find text
