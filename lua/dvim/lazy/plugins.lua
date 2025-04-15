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
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      image = { enabled = true },
    },
    keys = {
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
      {
        "<leader>Z",
        function()
          Snacks.zen.zoom()
        end,
        desc = "Toggle Zoom",
      },
      {
        "<leader>.",
        function()
          Snacks.scratch()
        end,
        desc = "Toggle Scratch Buffer",
      },
      {
        "<leader>S",
        function()
          Snacks.scratch.select()
        end,
        desc = "Select Scratch Buffer",
      },
      {
        "<leader>n",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification History",
      },
      {
        "<leader>cR",
        function()
          Snacks.rename.rename_file()
        end,
        desc = "Rename File",
      },
      {
        "<leader>gB",
        function()
          Snacks.gitbrowse()
        end,
        desc = "Git Browse",
      },
      {
        "<leader>gb",
        function()
          Snacks.git.blame_line()
        end,
        desc = "Git Blame Line",
      },
      {
        "<leader>gf",
        function()
          Snacks.lazygit.log_file()
        end,
        desc = "Lazygit Current File History",
      },
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gl",
        function()
          Snacks.lazygit.log()
        end,
        desc = "Lazygit Log (cwd)",
      },
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss All Notifications",
      },
    },
  },

  ------------------------
  --- Development
  --

  { "folke/lazydev.nvim" },

  ------------------------
  --- Languages
  --

  { "nvim-treesitter/nvim-treesitter",      build = ":TSUpdate" },
  { "nvim-treesitter/completion-treesitter" },

  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = { "saghen/blink.cmp" },
  --   config = function(_, opts)
  --     local lspconfig = require("lspconfig")
  --     for server, config in pairs(opts.servers) do
  --       config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
  --       lspconfig[server].setup(config)
  --     end
  --   end,
  -- }, -- blink.cmp

  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },

    -- config = function(_, opts)
    --   local lspconfig = require("lspconfig")
    --   local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    --
    --   for server, config in pairs(opts.servers) do
    --     -- passing config.capabilities to blink.cmp merges with the capabilities in your
    --     -- `opts[server].capabilities, if you've defined it
    --     -- config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
    --     config.capabilities = lsp_capabilities
    --     lspconfig[server].setup(config)
    --   end
    -- end,
  },

  { "nvimtools/none-ls.nvim" }, -- used for gdformat

  { "b0o/schemastore.nvim" },

  { "mfussenegger/nvim-lint" },
  { "stevearc/conform.nvim" },

  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = { { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" } },
  },

  { "windwp/nvim-ts-autotag" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  { "habamax/vim-godot" },
  { "Teatek/gdscript-extended-lsp.nvim" },
  { "mfussenegger/nvim-ansible" },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  ------------------------
  --- Snippets
  --

  { "L3MON4D3/LuaSnip",                             build = "make install_jsregexp" },
  { "molleweide/LuaSnip-snippets.nvim" },
  { "rafamadriz/friendly-snippets" },

  ------------------------
  --- Completion
  --

  -- {
  --   "saghen/blink.cmp",
  --   -- dependencies = { "rafamadriz/friendly-snippets" },
  --   -- version = "1.*",
  -- },

  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "onsails/lspkind.nvim" },
  { "petertriho/cmp-git" },
  { "saadparwaiz1/cmp_luasnip" },

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
  { "nvim-telescope/telescope-frecency.nvim" },
  { "smartpde/telescope-recent-files" },
  { "elianiva/telescope-npm.nvim" },

  -- {
  --   "lambdalisue/vim-fern",
  --   dependencies = {
  --     "lambdalisue/vim-fern-hijack",
  --     "lambdalisue/vim-fern-git-status",
  --     "lambdalisue/vim-fern-mapping-git",
  --     "lambdalisue/vim-fern-bookmark",
  --     "andykog/fern-highlight.vim",
  --     "yuki-yano/fern-preview.vim",
  --     {
  --       "lambdalisue/vim-fern-renderer-nerdfont",
  --       dependencies = {
  --         "lambdalisue/vim-glyph-palette",
  --         "lambdalisue/vim-nerdfont",
  --       },
  --     },
  --   },
  -- },

  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/snacks.nvim",
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        -- "<leader>-",
        "-",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- open_for_directories = true,
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
      -- floating_window_scaling_factor = 1,
      -- yazi_floating_window_border = "shadow",
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      -- vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },

  { "Myzel394/jsonfly.nvim" },

  { "folke/trouble.nvim",   dependencies = { "nvim-tree/nvim-web-devicons" } },
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

  { "nvim-lualine/lualine.nvim",         dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "kdheepak/tabline.nvim" },

  ------------------------
  --- Utilities
  --

  { "johmsalas/text-case.nvim" },
  { "LunarVim/bigfile.nvim" },
  { "pfeiferj/nvim-hurl" },
  { "brenoprata10/nvim-highlight-colors" },

  -----------------------------
  --- Themes
  --

  { "folke/tokyonight.nvim",             opts = { transparent = false } },
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
  { "nyoom-engineering/oxocarbon.nvim" },
  { "Shatur/neovim-ayu" },
  { "embark-theme/vim" },
  { "sainnhe/gruvbox-material" },
  { "navarasu/onedark.nvim" },
  {
    "srt0/everblush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everblush").setup({
        transparent = false,
      })
      vim.cmd.colorscheme("everblush")
    end,
  },
}
