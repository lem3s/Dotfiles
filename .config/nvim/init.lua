require "user.options"
require "user.keymaps"
require "user.plugins"
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
require "user.cmp"
require "user.lsp"
require "plug-colorizer"
