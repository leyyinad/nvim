local tabby = require("tabby")

local theme = {
	fill = "TabLineFill",
	head = "TabLine",
	current_tab = "StatusInsert",
	tab = "TabLine",
	win = "StatusNormal",
	tail = "TabLine",
}

tabby.setup({
	-- preset = "active_wins_at_end",
	line = function(line)
		return {
			{
				{ "  ", hl = theme.head },
				line.sep("", theme.head, theme.fill),
			},
			line.tabs().foreach(function(tab)
				local hl = tab.is_current() and theme.current_tab or theme.tab
				return {
					line.sep("", hl, theme.fill),
					-- tab.is_current() and "" or "󰆣",
					tab.number(),
					-- tab.name(),
					-- tab.close_btn(""),
					line.sep("", hl, theme.fill),
					hl = hl,
					margin = " ",
				}
			end),
			line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
				return {
					win.is_current() and line.sep("", theme.win, theme.fill) or " ",
					win.file_icon(),
					win.buf_name(),
					win.buf().is_changed() and "" or "",
					win.is_current() and line.sep("", theme.win, theme.fill) or " ",
					hl = win.is_current() and theme.win or theme.tab,
					margin = " ",
				}
			end),
		}
	end,
})

vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", {
	desc = "Add tab",
	noremap = true,
})

vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", {
	desc = "Close tab",
	noremap = true,
})

vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", {
	desc = "Close other tabs",
	noremap = true,
})
