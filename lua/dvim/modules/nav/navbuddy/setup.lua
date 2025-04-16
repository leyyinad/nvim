local navbuddy = require("nvim-navbuddy")

require("nvim-navic").setup {
  lsp = {
    auto_attach = true
  }
}

navbuddy.setup {
  lsp = {
    auto_attach = true
  }
}

-- navbuddy.open()
vim.keymap.set(
  { "n", "v" }, "<leader>s",
  navbuddy.open,
  {
    noremap = true,
    desc = "Navbuddy",
  }
)

