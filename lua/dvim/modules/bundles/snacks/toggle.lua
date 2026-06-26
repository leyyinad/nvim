Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>.s")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>.w")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>.N")
Snacks.toggle.diagnostics():map("<leader>.d")
Snacks.toggle.line_number():map("<leader>.n")
Snacks.toggle
	.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
	:map("<leader>.c")
Snacks.toggle.treesitter():map("<leader>.T")
Snacks.toggle.inlay_hints():map("<leader>.h")
Snacks.toggle.indent():map("<leader>.g")
Snacks.toggle.dim():map("<leader>.D")

function Snacks.toggle.autoformat_buffer()
	return Snacks.toggle.new({
		id = "autoformat_buffer",
		name = "Auto format (buffer)",
		get = function()
			return not vim.b.disable_autoformat
		end,
		set = function(state)
			vim.b.disable_autoformat = not state
		end,
	})
end

function Snacks.toggle.autoformat_global()
	return Snacks.toggle.new({
		id = "autoformat_global",
		name = "Auto format (global)",
		get = function()
			return not vim.g.disable_autoformat
		end,
		set = function(state)
			vim.g.disable_autoformat = not state
		end,
	})
end

Snacks.toggle.autoformat_buffer():map("<leader>.f")
Snacks.toggle.autoformat_global():map("<leader>.F")
