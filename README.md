# swift.nvim

A lua plugin for swift development in neovim.

## Overview

This is a simple plugin that exposes a few options that allow a swift
package manager project to be built, formatted, and tested.

This package does require [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim.git)
to be installed.  It also uses [swift-format](https://github.com/apple/swift-format.git) for
formatting files when the buffer is written in a `*.swift` file.

## Lazy Setup

```lua
return {
    'm-housh/swift.nvim',
    dependencies = {
        'akinsho/toggleterm.nvim'
    },
    config = function()
        require('swift').setup()
        local actions = require('swift.actions')

        -- Setup keymaps for build and test commands to your likings.
        vim.keymap.set('n', '<c-b>', actions.build, {})
        vim.keymap.set('n', '<c-u>', actions.test, {})
    end
}
```

## Options

If you do not want formatting to be setup when swift files are written in a buffer,
then you can pass `setup_formatting = false` to the setup function.

```lua
require('swift').setup({ setup_formatting = false })
```

## Usage

If you do not want to setup keymaps for the build or test commands, then
this plugin will expose commands that can be used to invoke the build or
test actions manually.

- **SwiftBuild**
- **SwiftTest**

If you would like to setup the automatic formatting option when they are not
setup in the configuration you can use the following command.

```lua
:lua require('swift.actions').setup_formatting()
```
