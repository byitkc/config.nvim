-- Run goimports on any go files on save
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("group1", { clear = true }),
  pattern = "*.go",
  callback = function()
    local filepath = vim.fn.expand("%:p")

    -- If the file is a `templ` generated `.go` file we will skip `goimports` as it
    -- overrides the templ formatting from `templ generate` on the file.
    local path_table = vim.fn.split(filepath, "/")
    local filename = path_table[#path_table]
    local subfile = string.find(filename, "%w_templ.go")
    if subfile ~= nil then
      return
    end

    -- Just incase there is a `*.go` file that isn't detected as `go`.
    if vim.bo.filetype ~= "go" then
      return
    end

    -- Execute `goimport` on the file and overwrite it.
    os.execute(vim.fn.join({ "goimports", "-w", filepath }, " "))
    -- "Re-edit" the file to update the buffer with the post `goimprts` file.
    vim.cmd.edit(filepath)
  end,
})
