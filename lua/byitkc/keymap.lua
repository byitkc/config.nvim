-- Sourcing changes in files, specifically setup around lua
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- Open Oil
vim.keymap.set("n", "<space>oo", "<cmd>Oil<CR>")
