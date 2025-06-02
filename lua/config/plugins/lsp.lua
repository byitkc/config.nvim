return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      {
        "saghen/blink.cmp",
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local opts = {
        capabilities = capabilities,
      }
      require("lspconfig").lua_ls.setup(opts)
      require("lspconfig").gopls.setup(opts)
      require("lspconfig").templ.setup(opts)
      require("lspconfig").tailwindcss.setup({})
      local html_opts = {
        filetypes = {
          "html",
        },
        provideFormatter = false,
      }
      require("lspconfig").html.setup(html_opts)

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if not client then return end
          -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
          if client:supports_method('textDocument/completion') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })
    end,

  }
}
