require("orgmode").setup({
  -- org_agenda_files = "…/**/*",
  -- org_default_notes_file = "…/refile.org",
})

-- Experimental LSP support
vim.lsp.enable("org")
