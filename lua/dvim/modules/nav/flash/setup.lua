local flash = require("flash")

vim.keymap.set({ "n", "x", "o" }, "<CR>", function()
	flash.jump({
		pattern = ".",
		search = {
			mode = function(pattern)
				if pattern:sub(1, 1) == "." then
					pattern = pattern:sub(2)
				end
				return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
			end,
		},
		jump = { pos = "range" },
	})
end, {
	desc = "Flash",
})

vim.keymap.set({ "n", "x", "o" }, "<c-space>", function()
	require("flash").treesitter({
		actions = {
			["<c-space>"] = "next",
			["<BS>"] = "prev",
		},
	})
end, { desc = "Treesitter incremental selection" })
