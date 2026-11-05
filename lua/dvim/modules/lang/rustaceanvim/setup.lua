local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<Leader>a", function()
  vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, {
  desc = "Rust code action",
  silent = true,
  buffer = bufnr,
})

-- vim.keymap.set("n", "<Space>a", function()
--   vim.cmd.RustLsp("hover actions")
-- end, {
--   {
--     desc = "Rust hover action",
--     silent = true,
--     buffer = bufnr,
--   },
-- })
