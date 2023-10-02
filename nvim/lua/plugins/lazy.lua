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
    -- html colours
    'NvChad/nvim-colorizer.lua',
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
    {
        'rose-pine/nvim',
        name = 'rose-pine'
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
    -- git plugin
    'tpope/vim-fugitive',
    -- highlighting
    "folke/trouble.nvim",
    -- autopair
    -- {
        --    'altermo/ultimate-autopair.nvim',
        --    event={'InsertEnter','CmdlineEnter'},
        --    branch='v0.6',
    -- },
    -- statusline
    'nvim-lualine/lualine.nvim',
    -- UI improvements
    -- {
        --    "folke/noice.nvim",
        --    event = "VeryLazy",
        --    opts = { },
        --    dependencies = {
            --    "MunifTanjim/nui.nvim",
            --    "rcarriga/nvim-notify",
        --    }
    -- },
}

local opts = {}

require('lazy').setup(plugins, opts)
