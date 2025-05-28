return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      scroll = { enabled = true },
    },
    keys = {
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss all notifications" },
    }
  }
}
