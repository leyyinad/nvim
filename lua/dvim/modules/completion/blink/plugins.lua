return {
  ---@type LazySpec
  {
    "saghen/blink.cmp",
    dependencies = {
      "xzbdmw/colorful-menu.nvim",
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
      "moyiz/blink-emoji.nvim",
      "Kaiser-Yang/blink-cmp-dictionary",
    },

    -- use a release tag to download pre-built binaries
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      enabled = function()
        local filetype = vim.bo[0].filetype
        if filetype == "TelescopePrompt" or filetype == "minifiles" or filetype == "snacks_picker_input" then
          return false
        end
        return true
      end,

      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      -- keymap = { preset = "default" },
      keymap = { preset = "enter" },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      -- (Default) Only show the documentation popup when manually triggered
      -- completion = { documentation = { auto_show = false } },
      completion = {
        documentation = { auto_show = true },
        menu = {
          draw = {
            columns = {
              { "kind_icon", "label", "label_description", "source_name", gap = 1 },
            },
            -- text
            -- treesitter = { "lsp" },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
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
        default = { "lsp", "path", "snippets", "buffer" },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },

    -- config = function(_, opts)
    -- 	local lspconfig = require("lspconfig")
    -- 	for server, config in pairs(opts.serves) do
    -- 		config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
    -- 		lspconfig[server].setup(config)
    -- 	end
    -- end,

    opts_extend = { "sources.default" },
  },
}
