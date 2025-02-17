local dap = require('dap')

return {
  require('neotest-phpunit') {
    filter_dirs = {
      "vendor",
      "node_modules",
      ".git",
    },
    env = {
      XDEBUG_MODE = "develop,coverage",
      XDEBUG_CONFIG = "idekey=neotest",
    },
    dap = dap.configurations.php[1],
  },
  require('neotest-vitest') {
  }
}
