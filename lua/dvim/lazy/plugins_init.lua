require("overseer").setup()
require("lazydev").setup()

require("notify").setup()

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-nvim-dap").setup()
require("mason-tool-installer").setup({})

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- if args.body and args.body ~= "" then
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      -- end
    end,
  },
  -- completion = {
  -- 	autocomplete = {
  -- 		cmp.TriggerEvent.TextChanged,
  -- 		cmp.TriggerEvent.InsertEnter,
  -- 	},
  -- 	completeopt = "menuone,noinsert,noselect",
  -- 	keyword_length = 0,
  -- },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if luasnip.expandable() then
          luasnip.expand()
        else
          cmp.confirm({
            select = true,
          })
        end
      else
        fallback()
      end
    end),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    -- { name = "vsnip" }, -- For vsnip users.

    { name = "luasnip" }, -- For luasnip users.
    -- { name = "luasnip", option = { show_autosnippets = true } }, -- For luasnip users.

    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = "buffer" },
  }),
  formatting = {
    expandable_indicator = true,
    fields = { "abbr", "kind", "menu" },
    format = function(entry, item)
      local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })

      item = require("lspkind").cmp_format({
        mode = "symbol", -- show only symbol annotations
        maxwidth = {
          -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          -- can also be a function to dynamically calculate max width such as
          -- menu = function() return math.floor(0.45 * vim.o.columns) end,
          menu = 50, -- leading text (labelDetails)
          abbr = 50, -- actual suggestion item
        },
        ellipsis_char = "…", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        show_labelDetails = true, -- show labelDetails in menu. Disabled by default

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))

        before = function(entry2, vim_item)
          if entry2.completion_item.detail ~= nil and entry2.completion_item.detail ~= "" then
            vim_item.menu = entry2.completion_item.detail
          else
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry2.source.name]
          end

          return vim_item
        end,
      })(entry, item)
      if color_item.abbr_hl_group then
        item.kind_hl_group = color_item.abbr_hl_group
        item.kind = color_item.abbr
      end
      return item
    end,
  },
})

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" },
  }, {
    { name = "buffer" },
  }),
})
require("cmp_git").setup()

-- TODO: extract modules

------------------------
--- mini
--

require("mini.ai").setup()
require("mini.align").setup()
require("mini.animate").setup()
require("mini.basics").setup({
  extra_ui = true,
})

require("mini.bufremove").setup()
require("mini.bracketed").setup()
require("mini.icons").setup()
require("mini.cursorword").setup()
require("mini.extra").setup()

-- require("mini.files").setup({
-- 	windows = {
-- 		max_number = math.huge,
-- 		preview = true,
-- 		width_focus = 32,
-- 		width_nofocus = 16,
-- 		width_preview = 80,
-- 	},
-- })

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

require("mini.indentscope").setup({
  symbol = "▏",
})
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
require("mini.surround").setup()
require("mini.trailspace").setup()
require("mini.visits").setup()

require("nvim-ts-autotag").setup()
require("dressing").setup()
require("trouble").setup()

---@diagnostic disable-next-line: missing-parameter
require("hurl").setup()

--require("gdscript_extended").setup()
require("textcase").setup()

require("nvim-highlight-colors").setup({})

require("typescript-tools").setup({})

require("conform").setup({})
