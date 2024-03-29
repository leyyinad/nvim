require("nvim-devdocs").setup {
  dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
  telescope = {},                                  -- passed to the telescope picker
  filetypes = {
    -- extends the filetype to docs mappings used by the `DevdocsOpenCurrent` command, the version doesn't have to be specified
    -- scss = "sass",
    -- javascript = { "node", "javascript" }
  },
  float_win = { -- passed to nvim_open_win(), see :h api-floatwin
    relative = "editor",
    height = 25,
    width = 100,
    border = "rounded",
  },
  wrap = false,                                         -- text wrap, only applies to floating window
  previewer_cmd = "glow",                               -- for example: "glow"
  cmd_args = { "-s", "dark", "-w", "80" },              -- example using glow: { "-s", "dark", "-w", "80" }
  cmd_ignore = {},                                      -- ignore cmd rendering for the listed docs
  picker_cmd = true,                                    -- use cmd previewer in picker preview
  picker_cmd_args = { "-s", "dark", "-w", "50", "-p" }, -- example using glow: { "-s", "dark", "-w", "50" }
  mappings = {                                          -- keymaps for the doc buffer
    open_in_browser = ""
  },
  ensure_installed = {
    "ansible",
    "apache_http_server",
    "bash",
    "css",
    "docker",
    "eslint",
    "gnu_make",
    "homebrew",
    "html",
    "http",
    "javascript",
    "jinja-2.11",
    "jq",
    "jquery",
    "kubernetes",
    "lua-5.4",
    "markdown",
    "nginx",
    "node",
    "npm",
    "php",
    "phpunit-9",
    "prettier",
    "sass",
    "sqlite",
    "svelte",
    "tailwindcss",
    "terraform",
    "typescript",
    "vite",
  }, -- get automatically installed
  -- after_open = function(bufnr) end, -- callback that runs after the Devdocs window is opened. Devdocs buffer ID will be passed in
  after_open = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Esc>', ':close<CR>', {})
  end
}


vim.keymap.set(
  { "n", "v" }, "<Space>d",
  "<cmd>DevdocsOpenCurrentFloat<cr>",
  {
    noremap = true,
    desc = "Open devdocs for current language"
  }
)

vim.keymap.set(
  { "n", "v" }, "<Space><Space>d",
  "<cmd>DevdocsOpenFloat<cr>",
  {
    noremap = true,
    desc = "Open devdocs"
  }
)
