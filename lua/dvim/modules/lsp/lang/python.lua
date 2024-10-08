local lspconfig = require("lspconfig")

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        rope_autoimport = {
          enabled = true,
        },
        rope_completion = {
          enabled = true,
          eager = true,
        },
        -- pydocstyle = {
        --   enabled = true,
        -- },
        pylint = {
          enabled = true,
        },
      }
    }
  }
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.py" },
  callback = function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.removeUnusedImports" },
        diagnostics = {},
      },
    })

    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.organizeImports" },
        diagnostics = {},
      },
    })

    vim.lsp.buf.format {}
  end,
})
