vim.opt.autoindent = true
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
vim.opt.cursorline = true
vim.opt.diffopt = {
	"internal",
	"filler",
	"closeoff",
	"context:12",
	"algorithm:histogram",
	"linematch:200",
	"indent-heuristic",
}
vim.opt.expandtab = true
vim.opt.fillchars = {
	diff = "",
}
vim.opt.foldclose = "all"
vim.opt.foldlevel = 100
vim.opt.foldmethod = "indent"
vim.opt.mousescroll = "ver:1,hor:6"
vim.opt.number = false -- true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.softtabstop = 2
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 200
vim.opt.wrap = false
