local bufferline = require('bufferline')

bufferline.setup{
  options = {
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --indicator = {
    --    icon = '▎',       -- this should be omitted if indicator style is not 'icon'
    --    style = 'icon' | 'underline' | 'none',
    --},
    offsets = {
      {
          filetype = "NvimTree",
          text = "NvimTree",
          highlight = "Directory",
          separator = true -- use a "true" to enable the default, or set your own character
      }
    },
    hover = {
      {
          enabled = true,
          delay = 100,
          reveal = {'close'}
      }
    }
  }
}

