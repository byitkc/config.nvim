--- This is a simple plugin for auto-closing brackets and other characters as needed and configured.
return {
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup()
    end,
  }
}
