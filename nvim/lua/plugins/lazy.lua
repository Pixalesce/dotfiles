local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
    -- Primeagen game to familiarise yourself with vim
    'ThePrimeagen/vim-be-good',
    -- syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-context',
    -- fuzzy finding
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    'theprimeagen/harpoon',
    -- undotree
    'mbbill/undotree',
    -- file tree
    'nvim-tree/nvim-tree.lua',
    -- icons
    'ryanoasis/vim-devicons',
    -- html colours
    'NvChad/nvim-colorizer.lua',
    -- -- multi-cursor
    -- use 'mg979/vim-visual-multi'
    -- commenting tool
    'tpope/vim-commentary',
    -- colour schemes
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    },
    -- autocompletion
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
            'williamboman/mason.nvim',
            build = function()
              vim.cmd ('MasonUpdate')
            end,
          },
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
          {'rafamadriz/friendly-snippets'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-buffer'},
          {'uga-rosa/cmp-dictionary'},
          {'rambhosale/cmp-bootstrap.nvim'},
       }
    },
    -- rust LSP
    'simrat39/rust-tools.nvim',
    -- git plugin
    'tpope/vim-fugitive',
    -- highlighting
    "folke/trouble.nvim",
}

local opts = {}

require('lazy').setup(plugins, opts)
