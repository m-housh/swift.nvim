local swift = {}

local actions = require('swift.actions')
local usercmd = vim.api.nvim_create_user_command

-- Setup the plugin.
swift.setup = function(opts)
  opts = opts or { setup_formatting = true }
  local setup_formatting = opts["setup_formatting"]

  if setup_formatting then
    actions.setup_formatting()
  end

  -- Exposes a command that can be used to build a
  -- swift package manager project.
  usercmd('SwiftBuild', actions.build, {})

  -- Exposes a command that can be used to envoke tests.
  usercmd('SwiftTest', actions.test, {})

end

swift.actions = actions

return swift
