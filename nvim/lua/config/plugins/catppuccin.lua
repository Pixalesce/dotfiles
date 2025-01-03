return {
  {
    "catppuccin/nvim",
    enabled = true,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        flavour = "macchiato",
        term_colors = true,
      })

      vim.cmd.colorscheme "catppuccin"
    end,
  }
}
