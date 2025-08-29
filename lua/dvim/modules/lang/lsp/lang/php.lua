local lspconfig = require("lspconfig")

-- lspconfig.phpactor.setup({
--   init_options = {
--     ["language_server_phpstan.enabled"] = true,
--     ["language_server_psalm.enabled"] = true,
--     ["language_server_php_cs_fixer.enabled"] = true,
--     ["php_code_sniffer.enabled"] = true,
--     ["phpunit.enabled"] = true,
--   },
-- })

vim.lsp.enable("phpactor", false)

vim.lsp.config("intelephense", {
	init_options = {
		globalStoragePath = os.getenv("HOME") .. "/.local/share/intelephense",
	},
	settings = {
		intelephense = {
			stubs = {
				"bcmath",
				"bz2",
				"calendar",
				"Core",
				"curl",
				"date",
				"dba",
				"dom",
				"enchant",
				"exif",
				"fileinfo",
				"filter",
				"ftp",
				"gd",
				"gettext",
				"hash",
				"iconv",
				"imap",
				"intl",
				"json",
				"ldap",
				"libxml",
				"mbstring",
				"mcrypt",
				"mysql",
				"mysqli",
				"password",
				"pcntl",
				"pcre",
				"posix",
				"PDO",
				"pdo_mysql",
				"Phar",
				"random",
				"readline",
				"recode",
				"Reflection",
				"regex",
				"session",
				"SimpleXML",
				"soap",
				"sockets",
				"sodium",
				"SPL",
				"standard",
				"superglobals",
				"sysvsem",
				"sysvshm",
				"tokenizer",
				"xml",
				"xdebug",
				"xmlreader",
				"xmlwriter",
				"yaml",
				"zip",
				"zlib",
				"acf-pro",
				"wordpress-globals",
				"wp-cli",
				"genesis",
				"polylang",
			},
		},
	},
})

vim.lsp.enable("intelephense")

-- lspconfig.psalm.setup({})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.php" },
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
