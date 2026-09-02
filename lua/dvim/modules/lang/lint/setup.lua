local lint = require("lint")
local parser = require("lint.parser")

local pattern = [[([^:]+):(%d+):([^:]+):(%a+):%s(.*)]]

local groups = {
  "file",
  "lnum",
  "code",
  "severity",
  "message",
}

local severity_map = {
  ["error"] = vim.diagnostic.severity.WARN,
  ["warning"] = vim.diagnostic.severity.WARN,
}

lint.linters.gdscript_formatter = {
  name = "gdscript_formatter",
  cmd = "gdscript-formatter",
  stdin = false,
  args = { "lint" },
  -- stream = "both",
  ignore_exitcode = true,
  env = nil,
  parser = parser.from_pattern(pattern, groups, severity_map, { ["source"] = "gdscript-formatter" }),
}

lint.linters_by_ft = {
  php = {
    "php",
    "phpcs",
    "phpstan",
  },
  gdscript = {
    "gdscript_formatter",
  },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    lint.try_lint()
  end,
})
