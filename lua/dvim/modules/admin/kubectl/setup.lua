require("kubectl").setup({})

vim.keymap.set("n", "<leader>k", '<cmd>lua require("kubectl").toggle({ tab: boolean })<cr>', {
  noremap = true,
  silent = true,
  desc = "Toggle kubectl",
})
