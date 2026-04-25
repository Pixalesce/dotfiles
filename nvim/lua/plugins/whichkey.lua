vim.pack.add({
    {
        src = "https://github.com/folke/which-key.nvim.git",
        name = "whichkey"
    }
})


local wk = require('which-key')
wk.add({
  -- { "<leader>e", group = "files" },
  { "<leader>f", group = "telescope" },
  { "<leader>g", group = "git" },
  { "<leader>s", group = "search" },
  { "<leader>c", group = "conform" },
})

vim.keymap.set("n", "<leader>?", function()
        require("which-key").show({ global = false })
    end, { desc = "Buffer Local Keymaps" }
)
