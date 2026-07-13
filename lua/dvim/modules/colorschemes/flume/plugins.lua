return {
	---@type LazySpec
	{
		"mitander/flume.nvim",
		priority = 1000,
		config = function(_, opts)
			require("flume").setup(opts)
			vim.cmd.colorscheme("flume")
		end,
	},
}
