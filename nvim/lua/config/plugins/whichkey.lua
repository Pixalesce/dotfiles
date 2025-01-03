return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      local wk = require('which-key')
      wk.add({
        -- { "<leader>e", group = "files" },
        { "<leader>f", group = "telescope" },
        { "<leader>g", group = "git" },
        { "<leader>q", group = "quickfix list" },
        { "<leader>s", group = "terminal" },
        { "<leader>v", group = "lsp actions" },
      })
    end,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}
