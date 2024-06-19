local lspconfig = require("lspconfig")

lspconfig.gdscript.setup {}
lspconfig.gdshader_lsp.setup {}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gdscript",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.autoindent = true
    vim.opt_local.expandtab = false
  end
})
