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
    disable = { "css", "scss" } -- see https://github.com/ap/vim-css-color/issues/173
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
