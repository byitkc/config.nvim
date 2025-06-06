return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {

    },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
        view_options = { show_hidden = false },
        win_options = {
          signcolumn = "yes:2"
        },
      })
      local o = require("oil")
      vim.keymap.set("n", "<space>ot", o.toggle_float)
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
