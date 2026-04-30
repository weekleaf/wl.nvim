return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {},
    },
    opts_extend = { "ensure_installed" },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")

      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

    -- example calling setup directly for each LSP
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig['lua_ls'].setup({ capabilities = capabilities })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.keymap.set("n", "K", vim.lsp.buf.hover)
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
            buffer = ev.buf,
            desc = "[LSP] Show diagnostic",
          })
        end,
      })
    end
  }
}