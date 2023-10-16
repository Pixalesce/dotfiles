# Guide to configuring NeoVim
This config uses a cousin of Vim known as [NeoVim](https://github.com/neovim/neovim), and would require an additional installation compared to using the built-in Vim editor. NeoVim was chosen as its plugin system is easier to use, among other things.

## Installation Instructions
1. Install [NeoVim](https://github.com/neovim/neovim#install-from-package)
2. Clone this repo using ```git clone https://github.com/Pixalesce/nVim_config ~/.config/nvim```
3. Open NeoVim (```nvim``` in the terminal)

Enjoy Vimming!
### Notes
- Requires NeoVim 0.7.x
- Checkout ```remap.lua``` for custom key bindings

## Directory Tree
``` bash
.
├── README.md
├── init.lua
├── lua
│   └── plugins
│        ├── init.lua
│        ├── lazy.lua
│        ├── remap.lua
│        └── set.lua
└── after
    └── plugin
        ├── fugitive.lua (git wrapper)
        ├── harpoon.lua (quick indexing and switching between files)
        ├── lsp.lua (code autocomplete and diagnostics)
        ├── lualine.lua (status line)
        ├── telescope.lua (quick file searching)
        ├── treesitter.lua (syntax highlighting)
        ├── treesitter-context.lua
        ├── trouble.lua
        └── undotree.lua
```

## Breakdown
### lua/plugins/
#### init.lua
This file tells nvim where to go to get plugin information

#### lazy.lua
Location where you install packages. The start point to your plugins.

See [Lazy.nvim](https://github.com/folke/lazy.nvim).

#### remap.lua
Custom keybindings 

#### set.lua
Custom settings

### after/plugin
Each individual `.lua` file contains custom settings for the various packages. Same thing if you install new packages.

## Resources
[0 to LSP: Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE&pp=ygUIMCB0byBsc3A%3D)

[Migrate from Packer to lazy.nvim](https://www.youtube.com/watch?v=cGZdvEIeiSg)

[Build your own Vim statusline](https://shapeshed.com/vim-statuslines/)

[Neovim docs](https://neovim.io/doc/)
