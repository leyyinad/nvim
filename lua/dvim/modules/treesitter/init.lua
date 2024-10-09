require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "html",
    "javascript",
    "lua",
    "markdown",
    "php",
    "python",
    "regex",
    "svelte",
    "swift",
    "yaml",
  },

  sync_install = false,

  auto_install = true,

  ignore_install = {},

  modules = {},

  highlight = {
    enable = true,
  },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
