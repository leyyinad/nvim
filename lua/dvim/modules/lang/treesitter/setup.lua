require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "css",
    "html",
    "ini",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "php",
    "python",
    "regex",
    "ruby",
    "rust",
    "ssh_config",
    "sql",
    "svelte",
    "swift",
    "typescript",
    "vimdoc",
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
