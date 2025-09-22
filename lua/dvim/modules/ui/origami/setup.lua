-- default settings
local origami = require("origami")

origami.setup({
	useLspFoldsWithTreesitterFallback = true,
	pauseFoldsOnSearch = true,
	foldtext = {
		enabled = true,
		padding = 3,
		lineCount = {
			template = "%d lines", -- `%d` is replaced with the number of folded lines
			hlgroup = "Comment",
		},
		diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
		gitsignsCount = true, -- requires `gitsigns.nvim`
	},
	autoFold = {
		enabled = true,
		kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
	},
	foldKeymaps = {
		setup = true, -- modifies `h`, `l`, and `$`
		hOnlyOpensOnFirstColumn = false,
	},
})

vim.keymap.set("n", "<Left>", function()
	origami.h()
end)
vim.keymap.set("n", "<Right>", function()
	origami.l()
end)
vim.keymap.set("n", "<End>", function()
	origami.dollar()
end)
