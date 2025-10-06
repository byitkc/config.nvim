return {
  {
    "pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({})
    end,
    trigger_events = { "InsertLeave" },
  }
}
