-- disable netrw at the very start of your init.lua
-- recommendation from the nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setting our keybind map leader key
vim.g.mapleader = " "

-- Setting default editor settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable `p` to paste from system clipboard as well
-- Also enables yanking to system clipboard
vim.opt.clipboard = "unnamedplus"
