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
    env = {
      XDEBUG_MODE = "develop",
      -- XDEBUG_MODE = "develop,coverage",
      XDEBUG_CONFIG = "idekey=neotest",
    },
    dap = dap.configurations.php[1],
  }),
  neotest_vitest({}),
}
