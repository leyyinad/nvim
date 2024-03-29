local comment_status_ok, comment = pcall(require, "Comment")
if not comment_status_ok then
  return
end

comment.setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  toggler = {
    line = "<C-_><C-_>",
    block = "<C-_><C-b>",
  },
  opleader = {
    line = "<C-_><C-_>",
    block = "<C-_><C-b>",
  }
}
