require('lualine').setup{
  options = {
    theme = 'gruvbox-material',
    disabled_filetypes = { 'packer', 'NvimTree' }
  },

  sections = {
    lualine_a = {
      {
        'filename',
        path = 3
      }
    },
    lualine_b = {},
    lualine_c = {}
  },

  tabline = {
    lualine_a = {
      {
        'buffers',
        symbols = {
          modified = ' ●',      -- Text to show when the buffer is modified
          alternate_file = '', -- Text to show to identify the alternate file
          directory =  '',     -- Text to show when the buffer is a directory
        },
      }
    },
    lualine_b = {'branch'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  },
}
