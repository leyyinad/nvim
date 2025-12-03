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
vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.opt.mousescroll = "ver:1,hor:6"
vim.opt.number = false
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,winsize,terminal"
vim.opt.softtabstop = 2
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 200
vim.opt.winborder = "rounded"
vim.opt.wrap = false
