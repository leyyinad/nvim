return {
	---@type LazySpec
	{
		"rmagatti/auto-session",
		lazy = false,

		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			suppressed_dirs = {
				"~/",
				"~/Projects",
				"~/Downloads",
				"~/Documents",
				"~/Documents/Projekte",
				"/",
			},
			-- log_level = 'debug',
		},
	},
}
