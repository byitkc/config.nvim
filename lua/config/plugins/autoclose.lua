--- This is a simple plugin for auto-closing brackets and other characters as needed and configured.
return {
  {
    "m4xshen/autoclose.nvim",
    enabled = false,
    config = function()
      require("autoclose").setup({
        keys = {
          ["'"] = { escape = false, close = false, pair = "''", disabled_filetypes = {} }
        }
      })
    end,
  }
}
