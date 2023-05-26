require "user.options"
require "user.keymaps"
require "user.plugins"
vim.o.background = "dark" -- or "light" for light mode
vim.cmd.colorscheme("gruvbox-material")
require "user.cmp"
require "user.lsp"
require "plug-colorizer"
require('lualine').setup{
  options = {
    theme = 'gruvbox-material'
  }
}

