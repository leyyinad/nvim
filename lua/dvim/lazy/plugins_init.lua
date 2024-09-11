require("overseer").setup()
require("mason").setup()
require("mason-lspconfig").setup()
--require("nvim-autopairs").setup()
require("mini.pairs").setup()
require("nvim-ts-autotag").setup()
require("nvim-surround").setup()
require("ibl").setup({
  indent = {
    -- highlight = {
    --   "CursorColumn",
    --   "Whitespace",
    -- },
    char = "▏",
  }
})
require("dressing").setup()
require("trouble").setup()
require("bigfile").setup {
  filesize = 2,      -- size of the file in MiB, the plugin round file sizes to the closest MiB
  pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
  features = {       -- features to disable
    "indent_blankline",
    "illuminate",
    "lsp",
    "treesitter",
    "syntax",
    "matchparen",
    "vimopts",
    "filetype",
  },
}
require("hurl").setup()
require("colorizer").setup()
require("gdscript_extended").setup()
require("textcase").setup()
