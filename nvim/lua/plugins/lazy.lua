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
        -- LSP
    {
        'williamboman/mason.nvim',
        build = function()
            vim.cmd ('MasonUpdate')
        end,
    },
    {'williamboman/mason-lspconfig.nvim'},
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    {'neovim/nvim-lspconfig'},  -- Required
    {'hrsh7th/nvim-cmp'},       -- Required
    {'hrsh7th/cmp-nvim-lsp'},   -- Required
    {
        'L3MON4D3/LuaSnip',
        version = "<CurrentMajor>",
    },       -- Required
    {'rafamadriz/friendly-snippets'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp-signature-help'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    -- git plugin
    'tpope/vim-fugitive',
    -- highlighting
    "folke/trouble.nvim",
    -- statusline
    'nvim-lualine/lualine.nvim',
}

local opts = {}

require('lazy').setup(plugins, opts)
