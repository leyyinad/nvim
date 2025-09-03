local tabby = require("tabby")

local theme = {
  fill = 'TabLineFill',
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}

tabby.setup({
	-- preset = "active_wins_at_tail",
	option = {
		nerdfont = true,
		-- lualine_theme = "auto",
	},
})
