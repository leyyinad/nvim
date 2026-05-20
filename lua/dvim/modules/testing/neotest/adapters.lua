local dap = require("dap")
local neotest_phpunit = require("neotest-phpunit")
local neotest_vitest = require("neotest-vitest")

return {
  neotest_phpunit({
    filter_dirs = {
      "vendor",
      "node_modules",
      ".git",
    },
    root_ignore_files = { ".gitignore" },
    phpunit_cmd = function()
      local file = vim.api.nvim_buf_get_name(0)
      local root = vim.fs.root(file, { "composer.json", "phpunit.xml" })

      if root then
        return root .. "/vendor/bin/phpunit"
      end

      return "phpunit"
    end,
    env = {
      XDEBUG_MODE = "develop",
      -- XDEBUG_MODE = "develop,coverage",
      XDEBUG_CONFIG = "idekey=neotest",
    },
    dap = dap.configurations.php[1],
  }),
  neotest_vitest({}),
}
