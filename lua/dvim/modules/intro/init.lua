local alpha_status_ok, alpha = pcall(require, "alpha")
if not alpha_status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
local theta = require("alpha.themes.theta")

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
    [[     @@@@@@@@@:                ]]
  },
  opts = {
    position = "center",
    hl = "Type",
  },
}


alpha.setup {
  layout = {
    { type = "padding", val = 2 },
    header,
    { type = "padding", val = 2 },
    theta.config.layout[4],
    { type = "padding", val = 2 },
  },
  opts = theta.config.opts,
}
