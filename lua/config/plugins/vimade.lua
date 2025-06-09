return {
  {
    "tadaa/vimade",
    config = function()
      require("vimade").setup(
        {
          recipe = { "minimalist", { animate = true } }
        }
      )
    end
  }
}
