vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(ev)
    vim.keymap.set({ "n", "x" }, "<leader>rd", "<Plug>(rust-doc-search)", {
      buffer = ev.buf,
      desc = "Search rust docs",
    })
  end,
})
