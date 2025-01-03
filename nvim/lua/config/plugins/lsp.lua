return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
      'saghen/blink.cmp',
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
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      require("lspconfig").lua_ls.setup({ capabilities = capabilities })
      require("lspconfig").pyright.setup({ capabilities = capabilities })
      require("lspconfig").gopls.setup({ capabilities = capabilities })
      require("lspconfig").rust_analyzer.setup({ capabilities = capabilities })
      require("lspconfig").vtsls.setup({ capabilities = capabilities })
      -- require("lspconfig").ts_ls.setup({ capabilities = capabilities })
      require("lspconfig").html.setup({ capabilities = capabilities })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            -- format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })

      vim.keymap.set("n", "<leader>fr", vim.lsp.buf.format, { desc = "format buffer" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP goto definition" })
      vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = "view workspace symbols" })
      vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "view diagnostics" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = "goto next diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = "goto prev diagnostic" })
      -- vim.keymap.set("n", "[e", vim.error.goto_next, { desc = "goto next error" })
      -- vim.keymap.set("n", "]e", vim.error.goto_prev, { desc = "goto prec error" })
      vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, { desc = "view code actions" })
      vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, { desc = "view references" })
      vim.keymap.set("n", "<leader>vri", vim.lsp.buf.implementation, { desc = "view implementations" })
      vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { desc = "rename variable" })
    end
  }
}
