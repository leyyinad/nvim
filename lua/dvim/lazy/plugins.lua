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
  { "b0o/schemastore.nvim" },
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
  { "L3MON4D3/LuaSnip" },

  { "kylechui/nvim-surround" },
  { "tummetott/unimpaired.nvim" },

  { "numToStr/Comment.nvim" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  { "nvim-tree/nvim-web-devicons" },

  { "windwp/nvim-autopairs" },
  { "windwp/nvim-ts-autotag" },

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

  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "nvim-treesitter/nvim-treesitter" }
  },

  { 'smoka7/hop.nvim' },

  { "tamago324/lir.nvim" },
  { "tamago324/lir-git-status.nvim" },
  { "tamago324/lir-bookmark.nvim" },
  { "tamago324/lir-mmv.nvim" },

  { "nvim-tree/nvim-tree.lua" },

  { "rcarriga/nvim-notify" },
  { "folke/noice.nvim",                   dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
  { "stevearc/dressing.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "RRethy/vim-illuminate" },
  { "wfxr/minimap.vim" },

  { "folke/trouble.nvim",                 dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "folke/which-key.nvim" },

  { "LunarVim/bigfile.nvim" },

  { "nvim-lualine/lualine.nvim",          dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "kdheepak/tabline.nvim" },
  { "folke/tokyonight.nvim",              opts = { transparent = false } },
  { "nanotech/jellybeans.vim" },
  { "craftzdog/solarized-osaka.nvim" },

  { "ap/vim-css-color" },
}
