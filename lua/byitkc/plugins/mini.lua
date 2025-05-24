-- lua/custom/plugins/mini.lua
return {
  {
    'echasnovski/mini.nvim',
    config = function()
      -- local git require("mini.git")
      require("mini.git").setup({})
      local statusline = require("mini.statusline")
      statusline.setup { use_icons = true }
    end
  }
}
