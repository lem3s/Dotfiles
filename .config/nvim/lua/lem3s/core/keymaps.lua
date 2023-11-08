vim.g.mapleader = " "

local keymap = vim.keymap --for conciseness

--
-- general keymaps
--

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>cl", ":noh<CR>") -- clear search higlighting

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

keymap.set("v", "<", "<gv") -- indent text blocks
keymap.set("v", ">", ">gv")

keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts) -- move text up and down
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)

--
-- plugins keymaps
--

-- vim-tmux-navigator
-- <ctrl>h :  move to left window
-- <ctrl>j :  move to down window
-- <ctrl>k :  move to up window
-- <ctrl>l :  move to right window

-- vim-surround 
-- ysw() : surround word with given symbol
-- dsw() : remove the given symbol arround the word
-- cs()() : change the given symbol for another given symbol

-- commment.nvim 
-- in normal mode : gcc 
-- in visual mode : gc or gb 

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- a : create new file
-- d : delete file

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") --find text
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") --find active buffers

