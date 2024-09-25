return {
  -- LuaSnip e friendly-snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets"
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  
  -- nvim-cmp para autocompletar
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip"  -- integração com LuaSnip
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)  -- para expandir snippets LuaSnip
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- confirma a seleção do autocompletar
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- Snippets source
        }, {
          { name = 'buffer' },
        })
      })
    end
  }
}
