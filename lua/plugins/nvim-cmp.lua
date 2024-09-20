local function setup_nvim_cmp()
  local cmp = require('cmp')
  local luasnip = require('luasnip')

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
      { name = 'path' },
    }),
    formatting = {
      format = require('lspkind').cmp_format({
        mode = 'symbol_text', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided width
        menu = {
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          path = "[Path]",
        }
      }),
    },
  })

  -- Configuração para a linha de comando
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
    
end

return {
  'hrsh7th/nvim-cmp', -- O motor principal de autocompletação
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- Fonte de autocompletação para Neovim LSP
    'hrsh7th/cmp-buffer', -- Fonte de autocompletação para o conteúdo do buffer atual
    'hrsh7th/cmp-path', -- Fonte de autocompletação para caminhos de arquivos
    'hrsh7th/cmp-cmdline', -- Fonte de autocompletação para a linha de comando
    'saadparwaiz1/cmp_luasnip', -- Integração com o gerenciador de snippets 'LuaSnip'
    'L3MON4D3/LuaSnip', -- Gerenciador de snippets
    'onsails/lspkind.nvim', -- Adiciona ícones bonitos às sugestões de autocompletação
    'garymjr/nvim-snippets',
  },

  config = setup_nvim_cmp
}
