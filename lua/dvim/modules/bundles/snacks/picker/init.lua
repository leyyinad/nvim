local npm_util = require('dvim.modules.bundles.snacks.picker.npm')
local dap_util = require('dvim.modules.bundles.snacks.picker.dap')

vim.keymap.set("n", "<Leader><Leader>d",
  function()
    if Snacks.dim.enabled then
      Snacks.dim.disable()
    else
      Snacks.dim()
    end
  end,
  {
    noremap = true,
    desc = "Dim"
  })

vim.keymap.set("n", "<leader>p",
  function()
    Snacks.picker()
  end,
  {
    noremap = true,
    desc = "All Pickers"
  })

vim.keymap.set("n", "<C-p>",
  function()
    Snacks.picker.git_files()
  end,
  {
    noremap = true,
    desc = "Git files"
  })

vim.keymap.set("n", "<leader>ff",
  function()
    Snacks.picker.files()
  end,
  {
    noremap = true,
    desc = "Files"
  })

vim.keymap.set("n", "<leader>fg",
  function()
    Snacks.picker.git_grep()
  end,
  {
    noremap = true,
    desc = "Live grep",
  }
)

vim.keymap.set("n", "<leader>fb",
  function()
    Snacks.picker.buffers()
  end,
  {
    noremap = true,
    desc = "Find buffers",
  })

vim.keymap.set("n", "<leader>fh",
  function()
    Snacks.picker.help()
  end, {
    noremap = true,
    desc = "Find help tags",
  })

vim.keymap.set("n", "<leader>fr",
  function()
    Snacks.picker.lsp_references()
  end,
  {
    noremap = true,
    desc = "Find LSP references for word under cursor",
  })

vim.keymap.set("n", "<leader>fs",
  function()
    Snacks.picker.lsp_workspace_symbols()
  end,
  {
    noremap = true,
    desc = "List workspace symbols",
  })

vim.keymap.set("n", "<leader>s",
  function()
    Snacks.picker.lsp_symbols()
  end,
  {
    noremap = true,
    desc = "List document symbols",
  })

vim.keymap.set("n", "<leader>ft",
  function()
    Snacks.picker.colorschemes()
  end,
  {
    noremap = true,
    desc = "Find, preview and select vim colorscheme",
  })

vim.keymap.set("n", "<leader>fd",
  function()
    Snacks.picker.diagnostics()
  end,
  {
    noremap = true,
    desc = "Find diagnostics",
  })

vim.keymap.set("n", "<leader>fn",
  function()
    Snacks.picker.notifications()
  end,
  {
    noremap = true,
    desc = "Find notification",
  })

vim.keymap.set("n", "<leader><leader>h",
  function()
    Snacks.picker.highlights()
  end,
  {
    noremap = true,
    desc = "Find highlights",
  })

vim.keymap.set("n", "<leader>fu",
  function()
    Snacks.picker.undo()
  end,
  {
    noremap = true,
    desc = "Search undo tree",
  })

vim.keymap.set("n", "<leader><leader>r",
  function()
    Snacks.picker.recent()
  end, {
    noremap = true,
    desc = "recent files",
  })

vim.keymap.set("n", "<leader><leader>n",
  function()
    npm_util.show_script_picker()
  end, {
    noremap = true,
    desc = "Run npm script",
  })

vim.keymap.set("n", "<Leader>lb",
  function()
    dap_util.show_breakpoint_picker()
  end,
  {
    noremap = true,
    desc = "List breakpoints",
  })
