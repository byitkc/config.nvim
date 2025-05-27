return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- "build" tells lazy that when we update this plugin, call the command.
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = {
	  "c",
	  "go",
	  "lua",
	  "markdown",
	  "markdown_inline",
	  "query",
	  "vim",
	  "vimdoc",
	},

	auto_install = false,
	highlight = {
	  enable = true,
	  disable = function(lang, buf)
	    local max_filesize = 100 * 1024 -- 100 KB
	    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	    if ok and stats and stats.size > max_filesize then
	      return true
	    end
	  end,
	  additional_vim_regex_highlighting = false,
	},
      }
    end
  }
} 
