vim.filetype.add({
  extension = {
    svx = "markdown",
  },
  filename = {
    [".prettierrc"] = "json",
  },
  pattern = {
    [".*%.yaml%.tpl"] =  "yaml",
  }
})
