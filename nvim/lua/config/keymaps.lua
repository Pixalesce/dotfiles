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

-- buffers
-- vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- quick switch to last edited file
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Last Edited Buffer" })

-- quick save
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "save file" })

-- quickfix list navigation with looping and cursor position preservation
local qf_positions = {}

local function save_position()
	local bufnr = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(bufnr)
	if filepath ~= "" then
		qf_positions[filepath] = vim.api.nvim_win_get_cursor(0)
	end
end

local function restore_position()
	local bufnr = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(bufnr)
	if filepath ~= "" and qf_positions[filepath] then
		vim.api.nvim_win_set_cursor(0, qf_positions[filepath])
	end
end

local function qf_next()
	save_position()
	local ok = pcall(vim.cmd.cnext)
	if not ok then
		vim.cmd.cfirst()
	end
	vim.schedule(restore_position)
	vim.cmd("normal! zz")
end

local function qf_prev()
	save_position()
	local ok = pcall(vim.cmd.cprev)
	if not ok then
		vim.cmd.clast()
	end
	vim.schedule(restore_position)
	vim.cmd("normal! zz")
end

vim.keymap.set("n", "<S-l>", qf_next, { desc = "next item in quickfix list" })
vim.keymap.set("n", "<S-h>", qf_prev, { desc = "prev item in quickfix list" })
vim.keymap.set("n", "[q", qf_prev, { desc = "prev item in quickfix list" })
vim.keymap.set("n", "]q", qf_next, { desc = "next item in quickfix list" })

-- lines shift
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever (pasting over something without that something replacing what you want to paste)
vim.keymap.set("x", "<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland (copying and deleting into the system clipboard)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "copy selection" })
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+y$]], { desc = "copy till eol" })

-- deletes without moving to register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "throw away text" })

-- autopair
-- vim.keymap.set("i", "`", "``<left>")
-- vim.keymap.set("i", '"', '""<left>')
-- vim.keymap.set("i", "(", "()<left>")
-- vim.keymap.set("i", "[", "[]<left>")
-- vim.keymap.set("i", "{", "{}<left>")
-- vim.keymap.set("i", "<", "<><left>")

-- inspection
-- vim.keymap.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- vim.keymap.set("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

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

-- undotree
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", function()
	require("undotree").open({ command = "topleft 40vnew" })
end, { desc = "Undotree Toggle" })

-- removed unused plugins
-- otherwise, manual steps are:
-- 1. :lua vim.pack.get()
-- 2. :lua vim.pack.del
local function pack_clean()
	local active_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		active_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not active_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	if #unused_plugins == 0 then
		print("No unused plugins.")
		return
	end

	local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end

vim.keymap.set("n", "<leader>pc", pack_clean, { desc = "Clean Unused Packages" })
