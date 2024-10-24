return {

  ------------------------
  --- Libraries / APIs
  --

  { "nvim-lua/plenary.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  ------------------------
  --- Package Managers
  --

  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "jay-babu/mason-nvim-dap.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },

  ------------------------
  --- Task Management
  --

  { "stevearc/overseer.nvim" },

  ------------------------
  --- Bundles
  --

  { "echasnovski/mini.nvim",                    version = false },

  ------------------------
  --- Development
  --

  { "folke/lazydev.nvim" },

  ------------------------
  --- Languages
  --

  { "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
  { "nvim-treesitter/completion-treesitter" },

  { "sheerun/vim-polyglot" },
  { "neovim/nvim-lspconfig" },
  { "nvimtools/none-ls.nvim" }, -- used for gdformat

  { "b0o/schemastore.nvim" },

  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = { { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" } },
  },

  { "windwp/nvim-ts-autotag" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  { "habamax/vim-godot" },
  { "Teatek/gdscript-extended-lsp.nvim" },

  ------------------------
  --- Completion
  --

  { "L3MON4D3/LuaSnip",                             build = "make install_jsregexp" },
  { "saghen/blink.cmp",                             version = "v0.*" },

  ------------------------
  --- Navigation
  --

  { "goolord/alpha-nvim" },

  { "SmiteshP/nvim-navic" },
  { "SmiteshP/nvim-navbuddy" },

  { "nvim-telescope/telescope.nvim",                tag = "0.1.5" },
  { "nvim-telescope/telescope-fzf-native.nvim",     build = "make" },
  { "nvim-telescope/telescope-dap.nvim" },
  { "Slotos/telescope-lsp-handlers.nvim" },
  { "debugloop/telescope-undo.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" }, -- CHECKME:
  { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
  { "nvim-telescope/telescope-file-browser.nvim" },

  { "Myzel394/jsonfly.nvim" },

  { "folke/trouble.nvim",                           dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "folke/which-key.nvim" },

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
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  ------------------------
  --- SCM
  --

  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim" },

  ------------------------
  --- Debugging
  --

  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-phpunit",
      "nvim-neotest/neotest-python",
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
  },

  { "mfussenegger/nvim-dap" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  { "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap" } },

  ------------------------
  --- Documentation
  --

  -- { "girishji/devdocs.vim" },

  ------------------------
  --- UI
  --

  { "rcarriga/nvim-notify" },
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  },
  { "stevearc/dressing.nvim" },

  { "IMOKURI/line-number-interval.nvim" },

  { "nvim-lualine/lualine.nvim",        dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "kdheepak/tabline.nvim" },

  ------------------------
  --- Utilities
  --

  { "johmsalas/text-case.nvim" },
  { "LunarVim/bigfile.nvim" },
  { "pfeiferj/nvim-hurl" },

  -----------------------------
  --- Themes
  --

  { "folke/tokyonight.nvim",            opts = { transparent = false } },
  { "nanotech/jellybeans.vim" },
  { "craftzdog/solarized-osaka.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  { "arzg/vim-colors-xcode" },
  { "kaicataldo/material.vim" },
  { "bettervim/yugen.nvim" },
  { "Zeioth/neon.nvim" },
  { "EdenEast/nightfox.nvim" },
}
