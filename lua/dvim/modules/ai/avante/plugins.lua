return {
	---@type LazySpec
	{
		"yetone/avante.nvim",
		build = "make",
		event = "VeryLazy",
		version = false,
		-- cmd = {
		--   "AvanteAsk",
		--   "AvanteBuild",
		--   "AvanteChat",
		--   "AvanteEdit",
		--   "AvanteFocus",
		--   "AvanteRefresh",
		--   "AvanteSwitchProvider",
		--   "AvanteShowRepoMap",
		--   "AvanteToggle",
		-- },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"stevearc/dressing.nvim",
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
