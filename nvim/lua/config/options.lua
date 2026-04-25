vim.opt.guicursor = ""

-- esentials
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- search
vim.opt.ignorecase = false
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- visuals
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"

vim.opt.signcolumn = "yes:1"
vim.opt.cmdheight = 1
vim.opt.synmaxcol = 300

vim.opt.linebreak = false
vim.opt.colorcolumn = "80"
vim.opt.numberwidth = 4

-- folding
vim.opt.smoothscroll = true
vim.wo.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 2
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10

-- file handling
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.autoread = true
vim.opt.autowrite = true

-- misc
vim.opt.spell = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"

-- behaviour
vim.opt.encoding = "UTF-8"
vim.opt.path:append("**")
-- vim.opt.autocomplete = true
-- vim.o.completeopt = 'menu,menuone,noselect'

-- opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- cli completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- diff
vim.opt.diffopt:append("linematch:60")

-- performance
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- misc
vim.g.autoformat = true
vim.g.trouble_lualine = true

vim.opt.jumpoptions = "view"
-- vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars:append({
	tab = "│─",
})
vim.opt.shiftround = true
vim.opt.shiftwidth = 4

vim.g.markdown_recommended_style = 0

-- This handles modern file types that Neovim doesn't recognize by default.
-- TypeScript configs get proper JSON with comments support, and all those .env.local, .env.production files get shell syntax highlighting.
vim.filetype.add({
	extension = {
		env = "dotenv",
	},
	filename = {
		[".env"] = "dotenv",
		["env"] = "dotenv",
	},
	pattern = {
		["[jt]sconfig.*.json"] = "jsonc",
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})
