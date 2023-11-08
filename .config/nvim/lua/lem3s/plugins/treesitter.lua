local status, treesitter = pcall(require, "nvim-treesitter")
if not status then
  return
end

treesitter.setup({
  highlight = {
    enable = true
  },
  indent = {enable = true},
  autotag = {enable = true},
  ensure_installed = {
    "html",
    "css",
    "javascript",
    "c",
    "markdown",
    "lua",
    "bash",
    "json",
    "python",
  },
  auto_install = true,
})
