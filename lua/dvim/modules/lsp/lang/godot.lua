local lspconfig = require("lspconfig")

vim.g.godot_executable = '/Applications/Godot.app/Contents/MacOS/Godot';

lspconfig.gdscript.setup {}
lspconfig.gdshader_lsp.setup {}

-- util.root_pattern("project.godot", ".git")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gd", "gdscript", "gdscript3" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.autoindent = true
    vim.opt_local.expandtab = false
  end
})

-- auto-remove unused imports when saving
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.gd" },
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
