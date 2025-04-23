local navbuddy = require("nvim-navbuddy")

navbuddy.setup({
  window = {
    border = "rounded",
    size = "85%",
  },
  lsp = {
    auto_attach = true,
  },
})

-- navbuddy.open()
vim.keymap.set({ "n", "v" }, "<leader>s", navbuddy.open, {
  noremap = true,
  desc = "Navbuddy",
})
