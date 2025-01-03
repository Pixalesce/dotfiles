return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup({
      defaults = require('telescope.themes').get_ivy(),
      extensions = {
        fzf = {}
      }
    })

    require('telescope').load_extension('fzf')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'search buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'search help tags' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'search git files' })

    vim.keymap.set("n", "<space>fn", function()
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath("config")
      }
    end, { desc = 'search neovim config files' })
    vim.keymap.set("n", "<space>fp", function()
      require('telescope.builtin').find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      }
    end, { desc = 'search plugin info files' })

    require "config.telescope.multigrep".setup()
  end
}
