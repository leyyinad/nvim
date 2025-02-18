vim.keymap.set("n", "-", "<CMD>Fern %:h<CR>", { desc = "Open file tree" })
vim.keymap.set("n", "<Space>-", "<CMD>Fern . -reveal=% -drawer -toggle<CR>", { desc = "Open file tree in drawer" })

vim.g["fern#renderer"] = "nerdfont"

vim.g["fern_git_status#disable_ignored"] = 1
vim.g["fern_git_status#disable_untracked"] = 1
vim.g["fern_git_status#disable_submodules"] = 1
vim.g["fern_git_status#disable_directories"] = 1

-- vim.g["fern#disable_default_mappings"] = 1

-- local myGlyphPaletteGroup = vim.api.nvim_create_augroup("my-glyph-palette", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   command = "call glyph_palette#apply()",
--   pattern = "fern",
--   group = myGlyphPaletteGroup,
-- })

-- vim.keymap.set("n", "p", "<Plug>fern-action-preview:toggle<CR>", { silent = true, buffer = true })
-- vim.keymap.set("n", "p", "<Plug>(fern-action-preview:toggle)", { silent = true, buffer = true })
