return {
  { "nvim-lua/plenary.nvim" },
  { "stevearc/overseer.nvim" },
  { "folke/neodev.nvim" },
  { "MunifTanjim/nui.nvim" },

  { "nvim-treesitter/nvim-treesitter",            build = ":TSUpdate" },
  { "nvim-treesitter/completion-treesitter" },

  { "sheerun/vim-polyglot" },

  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },

  { "echasnovski/mini.nvim",                      version = false },

  { "b0o/schemastore.nvim" },
  { "someone-stole-my-name/yaml-companion.nvim",  dependencies = { { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" } } },

  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "petertriho/cmp-git",                         dependencies = { "nvim-lua/plenary.nvim" } },
  { "hrsh7th/nvim-cmp" },

  { "SmiteshP/nvim-navic" },
  { "SmiteshP/nvim-navbuddy" },

  { "nvim-neotest/neotest",                       dependencies = { "olimorris/neotest-phpunit", "nvim-neotest/neotest-python", "haydenmeade/neotest-jest", "marilari88/neotest-vitest" } },

  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui",                       dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  { "theHamsta/nvim-dap-virtual-text",            dependencies = { "mfussenegger/nvim-dap" } },

  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim" },

  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip",                           build = "make install_jsregexp" },

  -- { "JoosepAlviste/nvim-ts-context-commentstring" },

  { "nvim-tree/nvim-web-devicons" },

  { "windwp/nvim-ts-autotag" },

  { "pfeiferj/nvim-hurl" },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-->", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  { "nvim-telescope/telescope.nvim",                tag = "0.1.5" },
  { "nvim-telescope/telescope-fzf-native.nvim",     build = "make" },
  { "nvim-telescope/telescope-dap.nvim" },
  { "Slotos/telescope-lsp-handlers.nvim" },
  { "debugloop/telescope-undo.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" }, -- CHECKME:
  { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "Myzel394/jsonfly.nvim" },

  { "habamax/vim-godot" },
  { "Teatek/gdscript-extended-lsp.nvim" },

  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "nvim-treesitter/nvim-treesitter" }
  },

  { 'johmsalas/text-case.nvim' },

  -- { "tamago324/lir.nvim" },
  -- { "tamago324/lir-git-status.nvim" },
  -- { "tamago324/lir-bookmark.nvim" },
  -- { "tamago324/lir-mmv.nvim" },

  { "nvim-tree/nvim-tree.lua" },

  { "rcarriga/nvim-notify" },
  { "folke/noice.nvim",             dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
  { "stevearc/dressing.nvim" },
  -- {
  --   "wfxr/minimap.vim",
  --   build = "cargo install --locked code-minimap",
  --   lazy = false,
  --   cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
  --   init = function()
  --     vim.g.minimap_width = 10
  --     vim.g.minimap_auto_start = 0
  --     vim.g.minimap_auto_start_win_enter = 1
  --   end,
  -- },

  { "folke/trouble.nvim",               dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "folke/which-key.nvim" },

  { "goolord/alpha-nvim" },

  -- { "norcalli/nvim-colorizer.lua" },

  { "LunarVim/bigfile.nvim" },

  { "IMOKURI/line-number-interval.nvim" },

  { "nvim-lualine/lualine.nvim",        dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "kdheepak/tabline.nvim" },
  -- { "nanozuki/tabby.nvim",              dependencies = { "nvim-tree/nvim-web-devicons" } },


  -----------------------------
  --- Themes
  --

  { "folke/tokyonight.nvim",            opts = { transparent = false } },
  { "nanotech/jellybeans.vim" },
  { "craftzdog/solarized-osaka.nvim" },
  { "catppuccin/nvim",                  name = "catppuccin",                             priority = 1000 },
  { 'arzg/vim-colors-xcode' },
  { 'kaicataldo/material.vim' },
  { 'bettervim/yugen.nvim' },
  { 'Zeioth/neon.nvim' },
  { 'EdenEast/nightfox.nvim' },
}
