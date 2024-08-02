return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local nvimtree = require("nvim-tree")
    
    nvimtree.setup({
      hijack_cursor = true,
      view = {
	width = 30,
      },
      actions = {
	open_file = {
	  window_picker = {
	    enable = false,
          },
        },
      },
      filters = {
	custom = { "^.git$" },
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>")
    keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFileToggle<CR>")
    keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>")
    keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<CR>")
  end
}
