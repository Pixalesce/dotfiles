vim.pack.add({
    {
        src = "https://github.com/catppuccin/nvim",
        name = "catppuccin"
    }
})

require("catppuccin").setup({
    transparent_background = true,
    float = {
      transparent = true,
      solid = false,
    },
    flavour = "auto",
    background = {
      light = "latte",
      dark = "macchiato",
    },
})

vim.cmd.colorscheme("catppuccin")
