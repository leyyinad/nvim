require("blink.cmp").setup({
  keymap = {
    preset = "enter",
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  cmdline = {
    enabled = true,
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
      menu = {
        auto_show = true,
      },
      ghost_text = {
        enabled = true,
      },
    },
    keymap = {
      preset = "inherit",
      ["<S-Tab>"] = { "insert_prev" },
      ["<Tab>"] = { "show", "accept", "insert_next" },
      ["<C-p>"] = { "insert_prev" },
      ["<C-n>"] = { "insert_next" },
      ["<CR>"] = { "accept_and_enter", "fallback" },
      ["<Up>"] = { "fallback" },
      ["<Down>"] = { "fallback" },
    },
  },

  completion = {
    documentation = {
      auto_show = true,
    },
    menu = {
      draw = {
        columns = {
          { "kind_icon", "label", "label_description", "source_name", gap = 1 },
        },
        components = {
          label = {
            text = function(ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end,
          },
          -- customize the drawing of kind icons
          kind_icon = {
            text = function(ctx)
              -- default kind icon
              local icon = ctx.kind_icon
              -- if LSP source, check for color derived from documentation
              if ctx.item.source_name == "LSP" then
                local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                if color_item and color_item.abbr ~= "" then
                  icon = color_item.abbr
                end
              end
              return icon .. ctx.icon_gap
            end,
            highlight = function(ctx)
              -- default highlight group
              local highlight = "BlinkCmpKind" .. ctx.kind
              -- if LSP source, check for color derived from documentation
              if ctx.item.source_name == "LSP" then
                local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                if color_item and color_item.abbr_hl_group then
                  highlight = color_item.abbr_hl_group
                end
              end
              return highlight
            end,
          },
        },
      },
    },
    accept = {
      auto_brackets = {
        enabled = true,
        default_brackets = { "(", ")" },
      },
    },
    ghost_text = {
      enabled = true,
    },
  },
  snippets = {
    preset = "luasnip",
  },
  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
    },
    per_filetype = {
      sql = { "snippets", "dadbod", "buffer" },
      mysql = { "snippets", "dadbod", "buffer" },
    },
    -- add vim-dadbod-completion to your completion providers
    providers = {
      dadbod = {
        name = "Dadbod",
        module = "vim_dadbod_completion.blink",
      },
    },
  },
  -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
  -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --
  -- See the fuzzy documentation for more information
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})
