require "user.options"
require "user.keymaps"
require "user.plugins"

vim.o.background = "dark" -- or "light" for light mode
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_transparent_background = '1'
vim.cmd.colorscheme("gruvbox-material")

require "user.cmp"
require "user.lsp"
require "plug-colorizer"

require('lualine').setup{
  options = {
    theme = 'gruvbox-material'
  }
}

require "user.toggleterm"
