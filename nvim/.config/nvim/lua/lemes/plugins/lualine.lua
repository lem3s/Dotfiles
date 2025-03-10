return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = 'gruvbox-material',
        component_separators = '',
        section_separators = '',
        icons_enabled = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {'filename', path = 1}
        },
        lualine_b = {'branch', 'diff'},
        lualine_c = {'diagnostics'},
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          'filetype'
        },
        lualine_z = {'location'},
        lualine_y = {'progress'},
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
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      extensions = {'nvim-tree', 'quickfix', 'fzf'},
    })
  end,
}
