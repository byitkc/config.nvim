-- Run goimports on any go files on save
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("group1", { clear = true }),
  pattern = "*.go",
  callback = function()
    local working_file = vim.fn.expand("%:p")
    local command = { "goimports", "-w", working_file }
    os.execute(vim.fn.join(command, " "))
    vim.cmd.edit(working_file)
  end,
})
