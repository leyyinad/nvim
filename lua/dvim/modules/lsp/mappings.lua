vim.keymap.set(
  "n", "<space>e", vim.diagnostic.open_float, {
    desc = "Show diagnostics"
  })

vim.keymap.set(
  "n", "[d", vim.diagnostic.goto_prev, {
    desc = "Move to prev. diagnostics"
  })

vim.keymap.set(
  "n", "]d", vim.diagnostic.goto_next, {
    desc = "Move to next diagnostics"
  })

vim.keymap.set(
  "n", "<space>q", vim.diagnostic.setloclist, {
    desc = "Add buffer diagnostics to loc. list"
  })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    vim.keymap.set(
      "n", "gD", vim.lsp.buf.declaration, {
        buffer = ev.buf,
        desc = "Jump to declaration",
      })
    vim.keymap.set(
      "n", "gd", vim.lsp.buf.definition, {
        buffer = ev.buf,
        desc = "Jump to definition",
      })
    vim.keymap.set(
      "n", "K", vim.lsp.buf.hover, {
        buffer = ev.buf,
        desc = "Hover",
      })
    vim.keymap.set(
      "n", "gi", vim.lsp.buf.implementation, {
        buffer = ev.buf,
        desc = "Jump to implementation",
      })
    vim.keymap.set(
      "n", "<C-k>", vim.lsp.buf.signature_help, {
        buffer = ev.buf,
        desc = "Show signature help",
      })
    vim.keymap.set(
      "n", "<space>wa", vim.lsp.buf.add_workspace_folder, {
        buffer = ev.buf,
        desc = "Add workspace folder",
      })
    vim.keymap.set(
      "n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {
        buffer = ev.buf,
        desc = "Remove workspace folder",
      })

    vim.keymap.set(
      "n", "<space>wl",
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      {
        buffer = ev.buf,
        desc = "List workspace folders",
      }
    )

    vim.keymap.set(
      "n", "<space>D",
      vim.lsp.buf.type_definition,
      {
        buffer = ev.buf,
        desc = "Jump to type definition",
      }
    )

    vim.keymap.set(
      "n", "<space>rn",
      vim.lsp.buf.rename,
      {
        buffer = ev.buf,
        desc = "Rename symbol",
      }
    )

    vim.keymap.set(
      { "n", "v" }, "<space>ca",
      vim.lsp.buf.code_action,
      {
        buffer = ev.buf,
        desc = "Select code action",
      }
    )

    vim.keymap.set(
      "n", "gr",
      vim.lsp.buf.references,
      {
        buffer = ev.buf,
        desc = "List all references",
      }
    )

    vim.keymap.set(
      "n", "<space>f",
      function()
        vim.lsp.buf.format { async = true }
      end,
      {
        buffer = ev.buf,
        desc = "Format buffer",
      }
    )
  end,
})
