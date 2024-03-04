local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'
local bookmark_actions = require 'lir.bookmark.actions'

require("lir").setup {
  show_hidden_files = false,
  ignore = {},
  devicons = {
    enable = true,
    highlight_dirname = true,
  },
  mappings = {
    ['l']     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['h']     = actions.up,
    ['q']     = actions.quit,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,

    ['J']     = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['C']     = clipboard_actions.copy,
    ['X']     = clipboard_actions.cut,
    ['P']     = clipboard_actions.paste,

    -- Bookmarks extension
    ['B']     = bookmark_actions.list,
    ['ba']    = bookmark_actions.add,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = false,
      highlight_dirname = false
    },

    -- -- You can define a function that returns a table to be passed as the third
    -- -- argument of nvim_open_win().
    -- win_opts = function()
    --   local width = math.floor(vim.o.columns * 0.8)
    --   local height = math.floor(vim.o.lines * 0.8)
    --   return {
    --     border = {
    --       "+", "─", "+", "│", "+", "─", "+", "│",
    --     },
    --     width = width,
    --     height = height,
    --     row = 1,
    --     col = math.floor((vim.o.columns - width) / 2),
    --   }
    -- end,
  },
  hide_cursor = true
}

require("lir.git_status").setup {
  show_ignored = false
}

require("lir.bookmark").setup {
  bookmark_path = '~/.local/share/lir_bookmark',
  mappings = {
    ['l']     = bookmark_actions.edit,
    ['<C-s>'] = bookmark_actions.split,
    ['<C-v>'] = bookmark_actions.vsplit,
    ['<C-t>'] = bookmark_actions.tabedit,
    ['<C-e>'] = bookmark_actions.open_lir,
    ['B']     = bookmark_actions.open_lir,
    ['q']     = bookmark_actions.open_lir,
  }
}
