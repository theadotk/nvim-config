-- Save
vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>")

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>q!<CR>")

-- Execute
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- Ntree
vim.keymap.set("n", "<leader>nt", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>nl", "<cmd>Vex<CR>")
vim.keymap.set("n", "<leader>nr", "<cmd>Vex!<CR>")

-- Copy to clipboard
vim.keymap.set("v", "<leader>y", "\"+y")

-- Window movement
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")

-- Stop highlighting
vim.keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>")

-- Quickfix list
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
