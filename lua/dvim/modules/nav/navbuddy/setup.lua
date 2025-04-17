local navbuddy = require("nvim-navbuddy")

navbuddy.setup({
  lsp = {
    auto_attach = true,
  },
})

-- navbuddy.open()
vim.keymap.set({ "n", "v" }, "<leader>s", navbuddy.open, {
  noremap = true,
  desc = "Navbuddy",
})
