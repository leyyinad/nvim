return {
	---@type LazySpec
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"b0o/schemastore.nvim",
			"Myzel394/jsonfly.nvim",
			"someone-stole-my-name/yaml-companion.nvim",
		},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{ "Slotos/telescope-lsp-handlers.nvim" },
	{ "debugloop/telescope-undo.nvim" },
	{ "nvim-telescope/telescope-ui-select.nvim" }, -- CHECKME:
	{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.1.0" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope-frecency.nvim" },
	{ "smartpde/telescope-recent-files" },
	{ "elianiva/telescope-npm.nvim" },
}
