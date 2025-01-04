# Pix dotfiles
Over time as I have been tinkering around with various command line centric applications, the number of configuration files I have to maintain gradually increased. As such, I have decided to bring my dotfiles and configurations into a single repo to save me from maintaining multiple repos.

See [Journal](journal/my-journey.md) to read my stories and progress with these technologies over the years ✨
# Workflow
My workflow currently consists of [Ghostty](ghostty/README.md) + [Neovim](nvim/README.md) + [Tmux](tmux/README.md).

# Directory Tree
```bash
.
├── README.md
├── journal
│   ├── my-journey.md
│   └── 18-months-on.md
├── ghostty
│   ├── README.md
│   └── config
├── nvim
│   ├── README.md
│   ├── init.lua
│   ├── after
│   │   └── ftplugin
│   │       └── lua.lua
│   └── lua
│       ├── opts.lua
│       ├── remap.lua
│       └── config
│           ├── lazy.lua
│           ├── plugins
│           │   ├── blink.lua
│           │   ├── catppuccin.lua
│           │   ├── diffview.lua
│           │   ├── fugitive.lua
│           │   ├── gitsigns.lua
│           │   ├── harpoon.lua
│           │   ├── lsp.lua
│           │   ├── lualine.lua
│           │   ├── mason.lua
│           │   ├── mini.lua
│           │   ├── oil.lua
│           │   ├── telescope.lua
│           │   ├── treesitter-context.lua
│           │   ├── treesitter.lua
│           │   ├── undotree.lua
│           │   └── whichkey.lua
│           └── telescope
│               └── multigrep.lua
└── tmux
    ├── README.md
    └── tmux.conf
```
