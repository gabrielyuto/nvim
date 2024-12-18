local mason = require "mason";
local mason_lspconfig = require "mason-lspconfig";

mason.setup({
 ui = {
  border = "rounded",
  icons = {
   package_installed = "✓",
   package_pending = "➜",
   package_uninstalled = "✗"
  }
 }
})

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",     -- lua
    "solargraph", --ruby
    "jdtls",      -- java
    "ts_ls", -- typescript e js
    "terraform-ls", --terraform-ls
    "tflint"
  },
  automatic_installation = true,
})

