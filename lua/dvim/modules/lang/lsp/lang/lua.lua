vim.lsp.config("emmylua_ls", {
	cmd = { "emmylua_ls" },
	settings = {
		Lua = {
			workspace = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					gloabls = { "vim" },
				},
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.lsp.enable("emmylua_ls")
