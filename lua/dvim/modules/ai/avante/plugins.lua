return {
  ---@type LazySpec
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    version = false,
    -- cmd = {
    --   "AvanteAsk",
    --   "AvanteBuild",
    --   "AvanteChat",
    --   "AvanteEdit",
    --   "AvanteFocus",
    --   "AvanteRefresh",
    --   "AvanteSwitchProvider",
    --   "AvanteShowRepoMap",
    --   "AvanteToggle",
    -- },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" }
        },
        ft = { "markdown", "Avante" }
      }
    }
  }
}
