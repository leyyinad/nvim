-- call glyph_palette#apply()
-- require('glyph_palette').apply()

vim.keymap.set("n", "p", "<Plug>(fern-action-preview:auto:toggle)", { silent = true, buffer = true })
vim.keymap.set("n", "C-u", "<Plug>(fern-action-preview:scroll:up:half)", { silent = true, buffer = true })
vim.keymap.set("n", "C-d", "<Plug>(fern-action-preview:scroll:down:half)", { silent = true, buffer = true })

vim.keymap.set("n", "-", "<Plug>(fern-action-leave)", { silent = true, buffer = true })
vim.keymap.set("n", "<Space>", "<Plug>(fern-action-mark)", { silent = true, buffer = true })

-- function! s:fern_settings() abort
--   nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
--   nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
--   nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
--   nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
-- endfunction
--
-- augroup fern-settings
--   autocmd!
--   autocmd FileType fern call s:fern_settings()
-- augroup END
--
-- function! s:fern_settings() abort
--   nmap <silent> <buffer> <expr> <Plug>(fern-quit-or-close-preview) fern_preview#smart_preview("\<Plug>(fern-action-preview:close)", ":q\<CR>")
--   nmap <silent> <buffer> q <Plug>(fern-quit-or-close-preview)
-- endfunction
