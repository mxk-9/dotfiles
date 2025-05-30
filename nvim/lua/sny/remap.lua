local kmset = vim.keymap.set
vim.g.mapleader = " "

local vc = vim.cmd

kmset("n", "<leader>pv", vc.Ex)

-- Toggle wrap lines
kmset("n", "<leader>l", ":set wrap!<CR>")

-- No highlight
kmset("n", "<leader>n", ":noh<CR>")

-- Open terminal in current buffer
kmset("n", "<leader>T", ":terminal<CR>:set nonumber<CR>:set norelativenumber<CR>i")
kmset("n", "<leader>t", ":tabnew<CR>")

-- Saving file
kmset("n", "<C-s>", ":w<CR>")
kmset("i", "<C-s>", "<Esc>:w<CR>")
kmset("v", "<C-s>", "<Esc>:w<CR>")


-- Make a session and quit
kmset("n", "<leader>Q", ":mks!<CR>")

-- Remap for esc
kmset("i", "jj", "<Esc>")
kmset("i", "<C-j>", "<Esc>")
kmset("i", "<C-M-j>", "<Esc>i")

-- Killing buffers like Emacs
kmset("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>")

-- Toggle number line
kmset("n", "<leader>L", ":set number!<CR>:set relativenumber!<CR>")

-- Move selected text
kmset("v", "J", ":m '>+1<CR>gv=gv")
kmset("v", "K", ":m '<-2<CR>gv=gv")
kmset("n", "J", "mzJ`z")

-- Switching buffers
kmset("n", "<leader>bn", ":bn<CR>")
kmset("n", "<leader>bN", ":bp<CR>")
kmset("n", "<leader>bd", ":bd<CR>")
kmset("n", "<leader>bD", ":bd!<CR>")
