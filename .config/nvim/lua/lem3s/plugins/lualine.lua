local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup()

require('lualine').setup({
  options = {
    theme = 'gruvbox-material',
    component_separators = '',
    section_separators = '',
    icons_enabled = true,
    globalstatus = true,
  },
  sections = {
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename', 'diagnostics'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = {'nvim-tree', 'quickfix'}
})
