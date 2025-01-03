return {
  {
    "ThePrimeagen/harpoon",
    enabled = true,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "harpoon current buffer" })
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-j>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

      vim.keymap.set("n", "<C-q>", function() harpoon:list():select(5) end)
      vim.keymap.set("n", "<C-s>", function() harpoon:list():select(6) end)
      -- vim.keymap.set("n", "<C-b>", function() harpoon:list():select(7) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-b-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-b-f>", function() harpoon:list():next() end)
    end
  }
}
