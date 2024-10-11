require("overseer").setup()
require("lazydev").setup()

require("notify").setup()

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-nvim-dap").setup()
require("mason-tool-installer").setup {}

------------------------
--- mini
--

-- TODO: extract module

require("mini.ai").setup()
require("mini.align").setup()
require("mini.animate").setup()
require("mini.basics").setup {
  extra_ui = true,
}

require("mini.bufremove").setup()
require("mini.bracketed").setup()
require("mini.icons").setup()
require("mini.cursorword").setup()
require("mini.extra").setup()

require("mini.files").setup {
  windows = {
    max_number = math.huge,
    preview = true,
    width_focus = 32,
    width_nofocus = 16,
    width_preview = 80,
  }
}

require("mini.fuzzy").setup()

local hipatterns = require('mini.hipatterns')
hipatterns.setup {
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
}

require("mini.indentscope").setup {
  symbol = '▏',
}
require("mini.jump").setup()
require("mini.jump2d").setup {
  view = {
    n_steps_ahead = 0,
  }
}

local MiniMap = require("mini.map")
MiniMap.setup {
  symbols = {
    -- encode = nil,
    -- encode = minimap.gen_encode_symbols.block('3x2'),
    encode = MiniMap.gen_encode_symbols.dot('4x2'),
    -- encode = minimap.gen_encode_symbols.shade('2x1'),

    -- Scrollbar parts for view and line. Use empty string to disable any.
    scroll_line = '█',
    scroll_view = '┃',
    -- - MiniMap.gen_encode_symbols.block()
    -- - MiniMap.gen_encode_symbols.dot()
    -- - MiniMap.gen_encode_symbols.shade()
  }
}
vim.keymap.set('n', '<Leader>mc', MiniMap.close)
vim.keymap.set('n', '<Leader>mf', MiniMap.toggle_focus)
vim.keymap.set('n', '<Leader>mo', MiniMap.open)
vim.keymap.set('n', '<Leader>mr', MiniMap.refresh)
vim.keymap.set('n', '<Leader>ms', MiniMap.toggle_side)
vim.keymap.set('n', '<Leader>mt', MiniMap.toggle)

require("mini.misc").setup()
require("mini.move").setup()
require("mini.operators").setup()
require("mini.pairs").setup()
require("mini.sessions").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()
require("mini.trailspace").setup()
require("mini.visits").setup()

require("nvim-ts-autotag").setup()
require("dressing").setup()
require("trouble").setup()

---@diagnostic disable-next-line: missing-parameter
require("hurl").setup()

require("gdscript_extended").setup()
require("textcase").setup()

---@diagnostic disable-next-line: missing-fields
require("blink.cmp").setup {
  ---@diagnostic disable-next-line: missing-fields
  highlight = {
    -- sets the fallback highlight groups to nvim-cmp's highlight groups
    -- useful for when your theme doesn't support blink.cmp
    -- will be removed in a future release, assuming themes add support
    use_nvim_cmp_as_default = true,
  },

  nerd_font_variant = "normal",

  -- experimental auto-brackets support
  ---@diagnostic disable-next-line: missing-fields
  accept = { auto_brackets = { enabled = true } },

  -- experimental signature help support
  ---@diagnostic disable-next-line: missing-fields
  trigger = { signature_help = { enabled = true } },
}
