return {
  {
    'mbbill/undotree',
    enabled = true,
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "toggle undotree" })
    end
  }
}
