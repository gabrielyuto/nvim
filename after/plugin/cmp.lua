local cmp = require "cmp";
local luasnip = require "luasnip";
local lspkind = require "lspkind";

cmp.setup({
 formatting = {
  format = lspkind.cmp_format({ -- Adiciona ícones bonitos
   mode = 'symbol', -- Mostrar apenas o símbolo
   maxwidth = 50,
  }),
 },
 snippet = {
  expand = function(args)
   vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
   require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  end,
 },
 window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
 },
 mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp.mapping.select_next_item(),
  ['<S-Tab>'] = cmp.mapping.select_prev_item(),
 }),
 sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'luasnip' },
  { name = 'buffer' },
 })
})

cmp.setup.cmdline({ '/', '?' }, {
 mapping = cmp.mapping.preset.cmdline(),
 sources = {
  { name = 'buffer' }
 }
})

cmp.setup.cmdline(':', {
 mapping = cmp.mapping.preset.cmdline(),
 sources = cmp.config.sources({
  { name = 'path' },
  { name = 'cmdline' }
 }),
 matching = { 
  disallow_symbol_nonprefix_matching = false 
 }
})




