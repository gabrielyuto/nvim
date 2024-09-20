local function setup_lspconfig()
  require("neodev").setup({})

  local lspconfig = require('lspconfig')

  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace"
        }
      }
    }
  })
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'folke/neodev.nvim', 
  },

  config = setup_lspconfig 
}

