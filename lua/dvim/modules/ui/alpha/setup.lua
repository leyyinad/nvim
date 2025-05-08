local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

require('alpha.term')

local theta = require("alpha.themes.theta")
local module_name = debug.getinfo(1).source
local module_dir = string.match(module_name, "^@(.+)/")
local assets_dir = module_dir .. "/assets"

-- chafa -f symbols -O 9 -s 32x16 ~/Desktop/dh-logo.png > dh.ansi

local header_ansi = {
  type = "terminal",
  command = "cat " .. assets_dir .. "/dh.ansi",
  width = 32,
  height = 14,
  opts = {
    redraw = true,
    position = "center",
    hl = "Whitespace",
  },
}

local header = {
  type = "text",
  val = {
    [[              @@@:             ]],
    [[              @@@@@            ]],
    [[              @@@@@            ]],
    [[              @@@@@            ]],
    [[              @@@@@            ]],
    [[     =@@@@@@@@@@@@@@@@@@@*     ]],
    [[   @@@@@@@@@@@@@@@@@@@@@@@@@:  ]],
    [[ %@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ]],
    [[+@@@@@        @@@@@      @@@@@@]],
    [[@@@@@         @@@@@       @@@@@]],
    [[@@@@@         @@@@@       @@@@@]],
    [[*@@@@@       *@@@@@       @@@@@]],
    [[ @@@@@@@#+*@@@@@@@        @@@@@]],
    [[  :@@@@@@@@@@@@@%         @@@= ]],
    [[     @@@@@@@@@:                ]],
  },
  opts = {
    position = "center",
    hl = "Whitespace",
  },
}

alpha.setup({
  layout = {
    { type = "padding", val = 2 },
    -- header,
    header_ansi,
    { type = "padding", val = 2 },
    theta.config.layout[4],
    { type = "padding", val = 2 },
  },
  opts = theta.config.opts,
})
