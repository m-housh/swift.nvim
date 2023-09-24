local actions = {}
local Job = require('plenary.job')
local Terminal = require('toggleterm.terminal').Terminal

actions.build = function()
 Terminal:new({
    cmd = "swift build",
    hidden = true,
    close_on_exit = false,
    auto_scroll = true
  }):toggle()
end

actions.test = function()
 Terminal:new({
    cmd = "swift test",
    hidden = true,
    close_on_exit = false,
    auto_scroll = true
  }):toggle()
end

return actions
