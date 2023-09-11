require('catppuccin').setup({
    transparent_background = true,
    flavour = "macchiato",
    background = {
        dark = "macchiato",
    },
    term_colors = true,
})

function SetColours(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

end

SetColours()
