vim.filetype.add({
  extension = {
    svx = "markdown",
  },
  filename = {
    [".prettierrc"] = "json",
    [".runner"] = "json",
    [".pg_service.conf"] = "dosini",
  },
  pattern = {
    [".*%.yaml%.tpl"] = "yaml",
    [".*/.kube/config"] = "yaml",
    [".*%.tf%.example"] = "terraform",
    ["Dockerfile%..*"] = "dockerfile",
  },
})
