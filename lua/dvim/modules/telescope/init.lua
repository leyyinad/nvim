local builtin = require("telescope.builtin")
local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
-- local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
  defaults = {
    layout_config = {
      height = 0.95,
      -- width = 0.95,
      width = 0.75,
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = {      -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          ["<C-space>"] = lga_actions.to_fuzzy_refine,
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
    -- file_browser = {
    --   theme = "ivy",
    --   -- disables netrw and use telescope-file-browser in its place
    --   hijack_netrw = true,
    --   initial_mode = "normal",
    --   mappings = {
    --     ["i"] = {
    --       -- your custom insert mode mappings
    --     },
    --     ["n"] = {
    --       -- your custom normal mode mappings
    --       ["-"] = fb_actions.goto_parent_dir,
    --       ["%"] = fb_actions.create,
    --     },
    --   },
    -- },
  },
})
require("telescope-lsp-handlers").setup()

telescope.load_extension("ui-select")
telescope.load_extension("dap")
telescope.load_extension("undo")
telescope.load_extension("live_grep_args")
telescope.load_extension("file_browser")
telescope.load_extension("yaml_schema")
telescope.load_extension("jsonfly")
telescope.load_extension("frecency")
telescope.load_extension("recent_files")
telescope.load_extension("npm")
telescope.load_extension("textcase")

-- vim.keymap.set(
--   "", "-",
--   -- telescope.extensions.file_browser.actions.goto_parent_dir,
--   ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
--   {
--     noremap = true,
--     desc = "File browser",
--   }
-- )

vim.keymap.set("n", "<C-p>", builtin.find_files, {
  noremap = true,
  desc = "Find files",
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {
  noremap = true,
  desc = "Find files",
})

vim.keymap.set(
  "n",
  "<leader>fg",
  telescope.extensions.live_grep_args.live_grep_args,
  -- builtin.live_grep,
  {
    noremap = true,
    desc = "Live grep",
  }
)

vim.keymap.set("n", "<leader>fb", builtin.buffers, {
  noremap = true,
  desc = "Find buffers",
})

vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
  noremap = true,
  desc = "Find help tags",
})

vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {
  noremap = true,
  desc = "Find LSP references for word under cursor",
})

vim.keymap.set("n", "<leader>fs", builtin.lsp_dynamic_workspace_symbols, {
  noremap = true,
  desc = "List LSP for all workspace symbols",
})

vim.keymap.set("n", "<leader>ft", function()
  require("telescope.builtin").colorscheme({
    enable_preview = true,
    ignore_builtin = true,
  })
end, {
  noremap = true,
  desc = "Find, preview and select vim colorscheme",
})

vim.keymap.set("n", "<leader>fn", telescope.extensions.notify.notify, {
  noremap = true,
  desc = "Find notification",
})

vim.keymap.set("n", "<leader>fu", telescope.extensions.undo.undo, {
  noremap = true,
  desc = "Search undo tree",
})

vim.keymap.set("n", "<leader>j", [[<CMD>Telescope jsonfly<CR>]], {
  noremap = true,
  desc = "jsonfly",
})

vim.keymap.set("n", "<leader>fw", telescope.extensions.recent_files.pick, {
  noremap = true,
  desc = "recent files",
})

vim.keymap.set("n", "<leader>,n", [[<CMD>Telescope npm scripts<CR>]], {
  noremap = true,
  desc = "Run npm script",
})

vim.keymap.set("n", "<leader>,p", [[<CMD>Telescope npm packages<CR>]], {
  noremap = true,
  desc = "List npm packages",
})
