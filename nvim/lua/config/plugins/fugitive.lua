return {
  {
    'tpope/vim-fugitive',
    enabled = true,
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "open fugitive window" })
    end
  }
}
