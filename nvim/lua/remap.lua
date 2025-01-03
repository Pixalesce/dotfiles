-- file that stores all remapping in neovim

-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "j", "jzzzv")
vim.keymap.set("n", "k", "kzzzv")
vim.keymap.set("n", "G", "Gzzzv")

-- quick save
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "save file" })

-- quickfix list naviation
vim.keymap.set("n", "<leader>qn", ":cnext<CR>", { desc = "next item in quickfix list" })
vim.keymap.set("n", "<leader>qp", ":cprev<CR>", { desc = "prev item in quickfix list" })

-- lines shift
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever (pasting over something without that something replacing what you want to paste)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland (copying and deleting into the system clipboard)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- toggle line wrap
vim.keymap.set("n", "<leader><leader>", function()
  if vim.o.wrap then
    vim.cmd("set nowrap")
    vim.cmd("set nolinebreak")
  else
    vim.cmd("set wrap")
    vim.cmd("set linebreak")
  end
end, { desc = "toggle line wrap" })


-- open a small terminal at the bottom of the screen
local job_id = 0
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)

  job_id = vim.bo.channel
end, { desc = "open terminal" })

-- example keymap that can be modified to run repeated terminal commands
-- vim.keymap.set("n", "<leader>somekeybinding", function()
--   -- can also be `make` or `go build` or `go run .`
--   vim.fn.chansend(job_id, { "ls -al\r\n" })
-- end, { desc = "run command to do XXX" })

-- see this video to create reusable terminals
-- https://www.youtube.com/watch?v=5PIiKDES_wc&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=16
