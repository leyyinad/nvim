local M = {}

local function find_package_json()
  return vim.fs.find("package.json", {
    upward = true,
    type = 'file',
    path = vim.fn.getcwd()
  })[1]
end

local function find_scripts()
  local pkg_json = find_package_json()
  if not pkg_json then
    vim.notify("No package.json found.")
    return
  end

  local content = vim.fn.readfile(pkg_json)
  if not content then
    vim.notify("package.json empty.")
    return
  end

  local json = vim.json.decode(table.concat(content, "\n"))
  return json.scripts
end

M.show_script_picker = function()
  local scripts = find_scripts()

  if not scripts then
    vim.notify("No scripts in package.json.")
    return
  end

  local items = {}
  for k, v in pairs(scripts) do
    table.insert(items, {
      name = k,
      text = k,
      action = v,
      preview = { text = v },
    })
  end

  Snacks.picker({
    title = "NPM Scripts",
    items = items,
    preview = "preview",
    format = function(item, _)
      return {
        { item.text,                        "SnacksPickerLabel" },
        { string.rep(" ", 20 - #item.name), virtual = true },
        { item.action,                      "SnacksPickerComment" }
      }
    end,
    confirm = function(picker, item)
      picker:close()

      local overseer = require("overseer")
      local task = overseer.new_task({
        name = "npm run " .. item.text,
        strategy = {
          "orchestrator",
          tasks = {
            {
              "shell",
              name = "npm run " .. item.text,
              cwd = vim.fn.getcwd(),
              cmd = "npm run " .. item.text,
            },
          },
        },
      })
      task:start()
      vim.cmd("OverseerOpen")
    end
  })
end

return M
