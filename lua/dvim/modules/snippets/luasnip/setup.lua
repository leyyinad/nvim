local luasnip = require("luasnip")
local luasnip_loaders_from_vscode = require("luasnip.loaders.from_vscode")

luasnip.snippets = require("luasnip_snippets").load_snippets()

luasnip_loaders_from_vscode.lazy_load()
luasnip_loaders_from_vscode.lazy_load({
  paths = "./d_snippets"
})
