vim.lsp.enable("pylyzer", false)

vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				rope_autoimport = {
					enabled = true,
					memory = true,
				},
				rope_completion = {
					enabled = true,
					eager = true,
				},
				-- pydocstyle = {
				--   enabled = true,
				-- },
				pylint = { enabled = false },
				pyflakes = { enabled = false },
				pylyzer = { enabled = false },
				ruff = { enabled = true },
			},
			rope = {
				ropeFolder = nil,
			},
		},
	},
})

vim.lsp.enable("pylsp")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.py" },
	callback = function()
		vim.lsp.buf.code_action({
			apply = true,
			context = {
				only = { "source.removeUnusedImports" },
				diagnostics = {},
			},
		})

		vim.lsp.buf.code_action({
			apply = true,
			context = {
				only = { "source.organizeImports" },
				diagnostics = {},
			},
		})

		vim.lsp.buf.format({})
	end,
})
