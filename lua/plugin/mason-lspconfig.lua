local lspconfig = require "lspconfig";
local mason_lspconfig = require "mason-lspconfig";

mason_lspconfig.setup({
  ensure_installed = { "pyright", "lua_ls", "dartls", "html", "css_variables", "cssls", "cssmodules_ls" },
  automatic_installation = true,
})

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup {}
  end,
  
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }
  end,
})