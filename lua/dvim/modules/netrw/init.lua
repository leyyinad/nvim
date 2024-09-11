vim.keymap.set("", "-", ":Explore<cr>", {})

local ghregex = [[\(^\|\s\s\)\zs\.\S\+]]

vim.g.netrw_list_hide =
    vim.fn['netrw_gitignore#Hide']() ..
    ghregex

vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 1
vim.g.netrw_hide = 1
