local lspconfig = require("lspconfig")

lspconfig.bashls.setup {}

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = ".env.*",
  callback = function()
    vim.bo.filetype = 'config'
  end
})
