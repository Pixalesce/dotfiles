vim.keymap.set(
  "n",
  "<leader>se",
  function() require("scissors").editSnippet() end,
  { desc = "Snippet: Edit" }
)

vim.keymap.set(
  { "n", "x" },
  "<leader>sa",
  function() require("scissors").addNewSnippet() end,
  { desc = "Snippet: Add" }
)

return {
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
      snippetDir = "~/.config/nvim/lua/config/plugins/snippets",
    }
  },
}
