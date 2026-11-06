return {
  ---@type LazySpec
  {
    "dswij/rust-doc.nvim", -- or a local path via `dir = '~/imp/rust-doc.nvim'`
    ft = "rust",
    cmd = { "RustDoc", "RustDocFuzzy", "RustDocModule", "RustDocPick", "RustDocGenerate" },
    opts = {}, -- see Configuration
  },
}
