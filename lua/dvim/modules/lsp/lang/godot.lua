local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local null_ls_helpers = require("null-ls.helpers")

vim.g.godot_executable = '/Applications/Godot.app/Contents/MacOS/Godot';

lspconfig.gdscript.setup {}
lspconfig.gdshader_lsp.setup {}

-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/HELPERS.md
local gdformat_source = {
  method = { null_ls.methods.FORMATTING, null_ls.methods.RANGE_FORMATTING },
  filetypes = { "gd", "gdscript", "gdscript3" },
  generator = null_ls_helpers.formatter_factory({
    command = vim.fs.joinpath(vim.fn.stdpath("data"), "mason/bin/gdformat"),
    args = { "$FILENAME" },
    to_temp_file = true,
    from_temp_file = true,
    use_cache = true,
  }),
}

null_ls.setup {
  sources = {
    gdformat_source,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
  }
}

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
