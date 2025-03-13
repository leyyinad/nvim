vim.filetype.add({
  extension = {
    svx = "markdown",
  },
  filename = {
    [".prettierrc"] = "json",
    [".runner"] = "json",
    [".pg_service.conf"] = "dosini",
    ["_js.php"] = "javascript",
  },
  pattern = {
    [".*%.yaml%.tpl"] = "yaml",
    [".*/.kube/config"] = "yaml",
    [".*%.tf%.example"] = "terraform",
    ["Dockerfile%..*"] = "dockerfile",
    [".*%.js.php"] = "javascript",
    [".*%.css.php"] = "css",
  },
})
