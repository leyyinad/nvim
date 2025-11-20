local lint = require('lint')

lint.linters_by_ft = {
  php = {
    'php',
    'phpcs',
    'phpstan',
  },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    lint.try_lint()
  end,
})
