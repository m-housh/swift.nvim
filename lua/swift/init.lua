local swift = {}

local actions = require('swift.actions')
local augroupname = "SwiftNvim"
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

-- Setup the plugin.
swift.setup = function(opts)
  opts = opts or {}

  local setup_formatting = opts["setup_formatting"]

  if setup_formatting or (setup_formatting ~= nil) then
    -- Creates an auto command group to register our
    -- auto commands in.
    local group = vim.api.nvim_create_augroup(augroupname, { clear = true })

    -- Format swift files when written to a buffer.
    autocmd(
      "BufWritePost",
      {
        group = group,
        pattern = "*.swift",
        command = ":silent exec '!swift-format --in-place %'"
      }
    )
  end

  -- Exposes a command that can be used to build a
  -- swift package manager project.
  usercmd('SwiftBuild', actions.build, {})

  -- Exposes a command that can be used to envoke tests.
  usercmd('SwiftTest', actions.test, {})

end

swift.actions = actions

return swift
