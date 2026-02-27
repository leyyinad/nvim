vim.filetype.add({
  extension = {
    svx = "markdown",
  },
  filename = {
    [".prettierrc"] = "json",
    [".runner"] = "json",
    [".pg_service.conf"] = "dosini",
    [".releaserc"] = "json",
    [".ncurc"] = "json",
    ["_js.php"] = "javascript",
  },
  pattern = {
    [".*%.yaml%.tpl"] = "yaml",
    [".*/%.kube/config"] = "yaml",
    [".*%.neon"] = "yaml",
    [".*%.import"] = "dosini",
    [".*%.tf%.example"] = "terraform",
    ["Dockerfile%..*"] = "dockerfile",
    [".*%.js%.php"] = "javascript",
    [".*%.css%.php"] = "css",
    [".*%.vhost%.conf"] = "apache",
    [".*%apache%.conf"] = "apache",
    [".*%.godot"] = "gdresource",
    [".*/%.config/bat/config"] = "dosini",
    [".*/%.config/rclone/.*%.conf"] = "dosini",
  },
})
