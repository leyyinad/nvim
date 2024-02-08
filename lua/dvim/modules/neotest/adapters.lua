local dap = require('dap')

require('neotest').setup {
  -- log_level = vim.log.levels.INFO,
  -- log_level = vim.log.levels.DEBUG,
  consumers = {
    overseer = require("neotest.consumers.overseer"),
  },
  adapters = {
    require('neotest-phpunit') {
      filter_dirs = {
        "vendor",
        "node_modules",
        ".git",
      },
      env = {
        XDEBUG_CONFIG = "idekey=neotest",
      },
      dap = dap.configurations.php[1],
    },
    -- require('neotest-phpunit') {
    --   -- phpunit_cmd = function()
    --   --   return "vendor/bin/phpunit"
    --   -- end,
    --   env = {
    --     XDEBUG_CONFIG = "idekey=neotest",
    --   },
    --   dap = dap.configurations.php[1],
    -- },
    -- require('neotest-python'),
    -- require('neotest-jest'),
    -- require('neotest-vitest'),
    -- require('neotest-plenary'),
  },
  quickfix = {
    enable = true,
    open = function()
      vim.cmd("Trouble quickfix")
    end,
  },
}
