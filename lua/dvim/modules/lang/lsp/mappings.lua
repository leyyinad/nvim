vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, {
  desc = "Add buffer diagnostics to loc. list",
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {
      buffer = ev.buf,
      desc = "Add workspace folder",
    })

    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {
      buffer = ev.buf,
      desc = "Remove workspace folder",
    })

    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, {
      buffer = ev.buf,
      desc = "List workspace folders",
    })
  end,
})

vim.keymap.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { desc = "LSP Go to Implementation" })
vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "LSP Rename Symbol" })
vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "LSP Go to References" })
vim.keymap.set("n", "grt", vim.lsp.buf.type_definition, { desc = "LSP Go to Type Definition" })
vim.keymap.set("n", "grx", vim.lsp.codelens.run, { desc = "LSP Run Codelens" })
vim.keymap.set("n", "gO", vim.lsp.buf.document_symbol, { desc = "LSP List document symbols" })
vim.keymap.set("i", "<C-S>", vim.lsp.buf.signature_help, { desc = "LSP Signature help" })
