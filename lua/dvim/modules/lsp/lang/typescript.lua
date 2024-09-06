local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup {}

-- auto-remove unused imports when saving
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.tsx", "*.ts" },
  callback = function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        -- only = { "source.removeUnusedImports.ts" },
        only = { "source.removeUnusedImports" },
        diagnostics = {},
      },
    })

    vim.lsp.buf.code_action({
      apply = true,
      context = {
        -- only = { "source.organizeImports.ts" },
        only = { "source.organizeImports" },
        diagnostics = {},
      },
    })

    vim.lsp.buf.format {}
  end,
})
