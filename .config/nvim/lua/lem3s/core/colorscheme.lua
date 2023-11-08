local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")
if not status then
  print("Colorscheme not found")
  return
end

vim.o.background = 'dark'

-- function ColorMyPensils()
-- --   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- --   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--   vim.g.gruvbox_material_transparent_background = '1'
-- end
--
-- ColorMyPensils()
--
