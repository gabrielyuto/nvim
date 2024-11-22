return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
  config = function()
      require("mason-lspconfig").setup({
          ensure_installed = { "pyright", "lua_ls", "gopls", "dartls" },
          automatic_installation = true,
      })

      -- Configuração automática para servidores LSP
      local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup_handlers({
          function(server_name) -- Configuração padrão para todos os servidores
              lspconfig[server_name].setup {}
          end,
          ["lua_ls"] = function() -- Configuração personalizada para lua_ls
              lspconfig.lua_ls.setup {
                  settings = {
                      Lua = {
                          diagnostics = {
                              globals = { "vim" }, -- Evita avisos sobre "vim"
                          },
                      },
                  },
              }
          end,
      })
  end,
}
