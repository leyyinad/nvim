local lspconfig = require("lspconfig")

-- lspconfig.denols.setup {}
lspconfig.eslint.setup {}

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
