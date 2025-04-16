local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

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
    hl = "Whitespace",
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
