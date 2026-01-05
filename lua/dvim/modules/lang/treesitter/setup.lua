local ts = require('treesitter-modules')

ts.setup({
  ensure_installed = {
    "bash",
    "c",
    "css",
    "dockerfile",
    "html",
    "ini",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "php",
    "python",
    "query",
    "regex",
    "ruby",
    "rust",
    "ssh_config",
    "sql",
    "svelte",
    "swift",
    "terraform",
    "toml",
    "typescript",
    "vimdoc",
    "yaml",
  },

  -- sync_install = false,
  auto_install = true,
  -- ignore_install = {},
  -- modules = {},

  fold = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
})

vim.keymap.set('n', '<Leader>.', ts.init_selection, { desc = "Start selecting nodes", noremap = true })
vim.keymap.set('x', '<Leader>.', ts.node_incremental, { desc = "Increment selection to node", noremap = true })
vim.keymap.set('x', '<Leader>;', ts.scope_incremental, { desc = "Increment selection to scope", noremap = true })
vim.keymap.set('x', '<Leader>-', ts.node_decremental, { desc = "Shrink selection", noremap = true })
