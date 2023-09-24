local actions = {}
local augroupname = "SwiftNvim"
local autocmd = vim.api.nvim_create_autocmd
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

actions.setup_formatting = function()
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

return actions
