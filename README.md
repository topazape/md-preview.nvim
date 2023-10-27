# md-preview.nvim

A Neovim plugin renders markdown file in terminal buffer.

Only tested under Mac.

- mdcat
![mdcat](./assets/mdcat.png)
- glow
![glow](./assets/glow.png)
- mdv
![mdv](./assets/mdv.png)

## Features

- Open terminal buffer in different direction: `vertical`, `horizontal`.
- Support auto refresh when file content changed.
- Support custom viewer command and args.

## Requirements
Any markdown viewer you like, such as:

### [mdcat](https://github.com/swsnr/mdcat)
`brew install mdcat`

### [glow](https://github.com/charmbracelet/glow)
`brew install glow`

### [terminal markdown viewer](https://github.com/axiros/terminal_markdown_viewer)
`brew install mdv`

## Installation

[Lazy](https://github.com/folke/lazy.nvim)

```lua
require("lazy").setup({
  "topazape/md-preview.nvim",
  ft = {"md", "markdown", "mkd", "mkdn", "mdwn", "mdown", "mdtxt", "mdtext", "rmd", "wiki"},
  config = function()
    require("md-preview").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the setup section below
    }),
  end
})
```

## Setup

Following example:

```lua
local mp = require("md-preview")
mp.setup({
      viewer = {
        -- mdcat
        exec = "mdcat",
        exec_path = "",
        args = { "--local" },

        -- glow
        -- exec = "glow",
        -- exec_path = "",
        -- args = { "-s", "dark" },

        -- mdv
        -- exec = "mdv',
        -- exec_path = "",
        -- args = { "-c", 80 },
      },
      -- Markdown preview term
      term = {
        -- reload term when rendered markdown file changed
        reload = {
          enable = true,
          events = {"InsertLeave", "TextChanged"},
        },
        direction = "vertical", -- choices: vertical / horizontal
        keys = {
          close = {"q"},
          refresh = "r",
        },
      },
    })
```

## Commands

- `:MPToggle`: toggle markdown preview open or close.
- `:MPOpen`: open markdown preview window.
- `:MPClose`: close markdown preview window.
- `:MPRefresh`: refresh markdown preview window.

## Thanks

[markdown-preview.nvim](https://github.com/0x00-ketsu/markdown-preview.nvim)

## License

MIT
