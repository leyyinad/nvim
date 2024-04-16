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

  highlight = {
    enable = true,
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
