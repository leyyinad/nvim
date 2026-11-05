return {
  ---@type LazySpec
  {
    "saghen/blink.cmp",
    dependencies = {
      "xzbdmw/colorful-menu.nvim",
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
      "moyiz/blink-emoji.nvim",
      "Kaiser-Yang/blink-cmp-dictionary",
      -- "Kaiser-Yang/blink-cmp-avante",
      "brenoprata10/nvim-highlight-colors",
    },
    -- use a release tag to download pre-built binaries
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts_extend = { "sources.default" },
  },
}
