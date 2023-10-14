# Pix dotfiles
Over time as I have been tinkering around with various command line centric applications, the number of configuration files I have to maintain gradually increased. As such, I have decided to bring my dotfiles and configurations into a single repo to save me from maintaining multiple repos.

See [Journal](journal.md) to read my story ✨
# Workflow
My workflow currently consists of [Alacritty](alacritty/README.md) + [Neovim](nvim/README.md) + [Tmux](tmux/README.md).

# Directory Tree
```bash
.
├── README.md
├── journal.md
├── alacritty
│   ├── README.md
│   └── alacritty.yml
├── nvim
│   ├── README.md
│   ├── after
│   │   └── plugin
│   │       ├── colors.lua
│   │       ├── fugitive.lua
│   │       ├── harpoon.lua
│   │       ├── lsp.lua
│   │       ├── telescope.lua
│   │       ├── treesitter-context.lua
│   │       ├── treesitter.lua
│   │       ├── trouble.lua
│   │       └── undotree.lua
│   ├── init.lua
│   └── lua
│       └── plugins
│           ├── init.lua
│           ├── lazy.lua
│           ├── remap.lua
│           └── set.lua
└── tmux
    ├── README.md
    └── tmux.conf
```
