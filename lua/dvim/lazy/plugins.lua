return {
  { "nvim-lua/plenary.nvim" },
  { "stevearc/overseer.nvim" },
  { "folke/neodev.nvim" },
  { "MunifTanjim/nui.nvim" },

  { "nvim-treesitter/nvim-treesitter",         build = ":TSUpdate" },

  { "sheerun/vim-polyglot" },

  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "petertriho/cmp-git",                      dependencies = { "nvim-lua/plenary.nvim" } },
  { "hrsh7th/nvim-cmp" },

  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui",                    dependencies = { "mfussenegger/nvim-dap" } },
  { "theHamsta/nvim-dap-virtual-text",         dependencies = { "mfussenegger/nvim-dap" } },

  { "nvim-neotest/neotest",                    dependencies = { "olimorris/neotest-phpunit", "nvim-neotest/neotest-python", "haydenmeade/neotest-jest", "marilari88/neotest-vitest" } },

  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim" },

  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },

  { "kylechui/nvim-surround" },
  { "tummetott/unimpaired.nvim" },
  { "tomtom/tcomment_vim" },
  { "ibhagwan/fzf-lua" },
  { "nvim-tree/nvim-web-devicons" },
  { "windwp/nvim-autopairs" },
  { "windwp/nvim-ts-autotag" },

  { "nvim-telescope/telescope.nvim",           tag = "0.1.5" },
  { "nvim-telescope/telescope-fzf-native.nvim" },
  { "nvim-telescope/telescope-dap.nvim" },
  { "Slotos/telescope-lsp-handlers.nvim" },

  { "rcarriga/nvim-notify" },
  { "folke/noice.nvim",                        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
  { "stevearc/dressing.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },

  { "folke/trouble.nvim",                      dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "folke/which-key.nvim" },

  { "nvim-lualine/lualine.nvim",               dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "kdheepak/tabline.nvim" },
  { "folke/tokyonight.nvim",                   opts = { transparent = false } },

  { "ap/vim-css-color" },
  -- { "nanotech/jellybeans.vim" },
}
