# Guide to configuring NeoVim
This config uses a cousin of Vim known as [NeoVim](https://github.com/neovim/neovim), and would require an additional installation compared to using the built-in Vim editor. NeoVim was chosen as its plugin system is easier to use, among other things.

## Installation Instructions
1. Install [NeoVim](https://github.com/neovim/neovim#install-from-package)
2. Clone this repo using ```git clone https://github.com/Pixalesce/nVim_config ~/.config/nvim```
3. Open NeoVim (```nvim``` in the terminal)

Enjoy Vimming!

### Notes
- Requires NeoVim 0.10.x
- Checkout ```remap.lua``` for custom key bindings
- See also plugin configuration files in `config/plugin/` that might have individual keybindings defined

## Directory Tree
``` bash
.
├── README.md
├── init.lua
├── after
│   └── ftplugin
│       └── lua.lua
└── lua
    ├── opts.lua
    ├── remap.lua
    └── config
        ├── lazy.lua
        ├── plugins
        │   ├── blink.lua
        │   ├── catppuccin.lua
        │   ├── diffview.lua
        │   ├── fugitive.lua
        │   ├── gitsigns.lua
        │   ├── harpoon.lua
        │   ├── lsp.lua
        │   ├── lualine.lua
        │   ├── mason.lua
        │   ├── mini.lua
        │   ├── oil.lua
        │   ├── telescope.lua
        │   ├── treesitter-context.lua
        │   ├── treesitter.lua
        │   ├── undotree.lua
        │   └── whichkey.lua
        └── telescope
            └── multigrep.lua
```

## Breakdown
### root
#### init.lua
Initialisation file informing nvim of files to source to load configuration

### lua
#### opts.lua
Custom settings

#### remap.lua
Custom keybindings 

### lua/config
#### lazy.lua
Simple initialisation and installation of `Lazy` plugin manager

See [Lazy.nvim](https://github.com/folke/lazy.nvim)

### lua/config/plugins
Each individual `.lua` file contains details of the plugin being installed, as well as configuration options

### after/ftplugin (file type plugin!)
#### lua.lua
Defining Lua specific options; similar files can be made for other languages as well

## Resources
`:help`  
[Neovim docs](https://neovim.io/doc/)  
[0 to LSP: Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE&pp=ygUIMCB0byBsc3A%3D)  
[Advent of Neovim](https://www.youtube.com/watch?v=TQn2hJeHQbM&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM)  
