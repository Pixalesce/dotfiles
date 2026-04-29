# Guide to configuring Neovim

This config uses a cousin of Vim known as [Neovim](https://github.com/neovim/neovim), and would require an additional installation compared to using the built-in Vim editor. Neovim was chosen as its plugin system is easier to use, among other things.

## Installation Instructions

1. Install [Neovim](https://github.com/neovim/neovim#install-from-package)
2. Clone this repo using `git clone https://github.com/Pixalesce/nVim_config ~/.config/nvim`
3. Install your desired language servers and formatters

```sh
# Language Server Installation
npm install -g @vtsls/language-server
npm i -g @tailwindcss/language-server
npm i -g vscode-langservers-extracted
npm install -g yaml-language-server
npm install -g bash-language-server
npm install -g pyright
brew install biome
rustup component add rust-analyzer
go install golang.org/x/tools/gopls@latest
cargo install --locked tree-sitter-cli

# Formatters Installation
brew install ruff black stylua biome taplo prettierd
go install golang.org/x/tools/cmd/goimports@latest
```

4. Open Neovim (`nvim` in the terminal)

Enjoy Vimming!

### Notes

- Requires Neovim 0.12.x
- Checkout `keymaps.lua` for custom key bindings
- See also plugin configuration files in `lua/plugin/` that might have individual keybindings defined

## Directory Tree

```bash
.
├── README.md
├── init.lua
├── lsp
│   ├── bashls.lua
│   ├── biome.lua
│   ├── cssls.lua
│   ├── eslint.lua
│   ├── gopls.lua
│   ├── html.lua
│   ├── jsonls.lua
│   ├── lua_ls.lua
│   ├── oxlint.lua
│   ├── pyright.lua
│   ├── rust_analyzer.lua
│   ├── tailwindcss.lua
│   ├── vtsls.lua
│   └── yamlls.lua
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── diagnostics.lua
│   │   ├── init.lua
│   │   ├── keymaps.lua
│   │   ├── lsp.lua
│   │   └── options.lua
│   ├── plugins
│   │   ├── blink.lua
│   │   ├── conform.lua
│   │   ├── git.lua
│   │   ├── grugfar.lua
│   │   ├── init.lua
│   │   ├── lualine.lua
│   │   ├── miniharp.lua
│   │   ├── oil.lua
│   │   ├── quickscope.lua
│   │   ├── snacks.lua
│   │   ├── telescope.lua
│   │   ├── theme.lua
│   │   ├── treesitter.lua
│   │   └── whichkey.lua
│   └── snippets
│       ├── package.json
│       └── typecript.json
├── after
│   └── ftplugin
│       └── lua.lua
└── nvim-pack-lock.json
```

## Breakdown

### root

#### init.lua

Initialisation file informing nvim of files to source to load configuration

#### nvim-pack-lock.json

Lock file maintaining hashes of installed plugins for versioning

### lua

### lua/config

Configurations do not all need to be done this way, but keeping them modular helps me to keep them organised logically for easier maintenance

#### init.lua

Telling nvim which modules to load

#### diagnostics.lua

Configuring the look and feel of diagnostics in the buffer, including useful keybindings to navigate through diagnostics

#### keymaps.lua

Configuring keybindings for the everyday use

#### lsp.lua

Configuring basic behaviour of lsp and enabling the desired ones

#### options.lua

Configuring Neovim settings, including relative number, etc.

#### autocmds.lua

Configuring autocommands that helps in the day to day workflow

### lua/plugins

Each individual `.lua` file contains details of the plugin being installed, as well as configuration options

### after/ftplugin (file type plugin!)

#### lua.lua

Defining Lua specific options; similar files can be made for other languages as well

## Resources

`:help`  
[Neovim docs](https://neovim.io/doc/)  
[0 to LSP: Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE&pp=ygUIMCB0byBsc3A%3D)  
[Advent of Neovim](https://www.youtube.com/watch?v=TQn2hJeHQbM&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM)  
[Setting up Neovim 0.12](https://tduyng.com/blog/neovim-basic-setup/)
