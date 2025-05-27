return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvime-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      })
      local tb = require("telescope.builtin")
      require("telescope").load_extension("fzf")
      vim.keymap.set("n", "<space>ff", tb.find_files)
      vim.keymap.set("n", "<space>fh", tb.help_tags)
      vim.keymap.set("n", "<space>flr", tb.lsp_references)
      vim.keymap.set("n", "<space>fb", tb.buffers)
      -- vim.keymap.set("n", "<space>fg", tb.live_grep)
      vim.keymap.set("n", "<space>fgbc", tb.git_bcommits)
      vim.keymap.set("n", "<space>fgc", tb.git_commits)

      vim.keymap.set("n", "<space>fn", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config")
        })
      end)

      vim.keymap.set("n", "<space>fp", function()
        tb.find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        })
      end)

      require("config.telescope.multigrep").setup()
    end,
  }
}
