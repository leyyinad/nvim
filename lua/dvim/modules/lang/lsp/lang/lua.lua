vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					gloabls = { "vim" },
				},
				library = {
					vim.env.VIMRUNTIME,
					vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy",
				},
			},
		},
	},
})

vim.lsp.enable("lua_ls")
