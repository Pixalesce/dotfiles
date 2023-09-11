vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ef", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever (pasting over something without that something replacing what you want to paste)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland (copying and deleting into the system clipboard)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- remaps C-c to escape
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>T", "<cmd>tabclose<CR>")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
-- va

-- my personal key remaps
vim.keymap.set("n", "<leader>ls", function()
  vim.cmd("ls")
end)
vim.keymap.set("n", "<leader>bn", function()
  vim.cmd("bn")
end)
vim.keymap.set("n", "<leader>bp", function()
  vim.cmd("bp")
end)
vim.keymap.set("n", "<leader>bw", function()
  vim.cmd("bw")
end)
vim.keymap.set("n", "<leader>bd", function()
  vim.cmd("bd")
end)
vim.keymap.set("n", "<leader>bw!", function()
  vim.cmd("bw!")
end)
vim.keymap.set("n", "<leader>bd!", function()
  vim.cmd("bd!")
end)
vim.keymap.set("n", "<leader>r", "<cmd>bd | e#<CR>")
vim.keymap.set("n", "<leader>c", "<cmd>%bd | e#<CR>")

-- save faster
vim.keymap.set("n", "<C-x><C-s>", ":w<Return>")