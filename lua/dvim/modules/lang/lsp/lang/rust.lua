vim.lsp.config("rust_analyzer", {

  on_attach = function(client, bufnr)
    -- Turn on inline type hints like `: String` or `: i32`
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,

  settings = {
    ["rust-analyzer"] = {
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      checkOnSave = {
        command = "clippy",
      },
      prodMacro = {
        enable = true,
      },
    },
  },
})

vim.lsp.enable("rust_analyzer")
