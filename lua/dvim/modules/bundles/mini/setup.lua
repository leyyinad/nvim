require("mini.ai").setup()
require("mini.align").setup()
require("mini.animate").setup()
require("mini.basics").setup({
	extra_ui = true,
})
require("mini.bufremove").setup()
require("mini.bracketed").setup()
require("mini.icons").setup()
require("mini.extra").setup()
require("mini.fuzzy").setup()

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

-- require("mini.indentscope").setup({
--   symbol = "▏",
-- })

require("mini.jump").setup()
require("mini.jump2d").setup({
	view = {
		-- n_steps_ahead = 1,
	},
	mapping = {
		start_jumping = "",
	},
})

local MiniMap = require("mini.map")
MiniMap.setup({
	symbols = {
		-- encode = nil,
		-- encode = minimap.gen_encode_symbols.block('3x2'),
		encode = MiniMap.gen_encode_symbols.dot("4x2"),
		-- encode = minimap.gen_encode_symbols.shade('2x1'),

		-- Scrollbar parts for view and line. Use empty string to disable any.
		scroll_line = "█",
		scroll_view = "┃",
		-- - MiniMap.gen_encode_symbols.block()
		-- - MiniMap.gen_encode_symbols.dot()
		-- - MiniMap.gen_encode_symbols.shade()
	},
})
vim.keymap.set("n", "<Leader>mc", MiniMap.close)
vim.keymap.set("n", "<Leader>mf", MiniMap.toggle_focus)
vim.keymap.set("n", "<Leader>mo", MiniMap.open)
vim.keymap.set("n", "<Leader>mr", MiniMap.refresh)
vim.keymap.set("n", "<Leader>ms", MiniMap.toggle_side)
vim.keymap.set("n", "<Leader>mt", MiniMap.toggle)

require("mini.misc").setup()
require("mini.move").setup()
require("mini.operators").setup()
require("mini.pairs").setup()
require("mini.sessions").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup({
	mappings = {
		add = "ys",
		delete = "ds",
		find = "",
		find_left = "",
		highlight = "",
		replace = "cs",

		-- Add this only if you don't want to use extended mappings
		-- suffix_last = "",
		-- suffix_next = ""
	},
	search_method = "cover_or_next",
})

-- Remap adding surrounding to Visual mode selection
vim.keymap.del("x", "ys")
vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

-- Make special mapping for "add surrounding for line"
vim.keymap.set("n", "yss", "ys_", { remap = true })

require("mini.visits").setup()
