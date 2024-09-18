local function setup_tree_sitter()
  require'nvim-treesitter.configs'.setup {
  
  -- Linguagens que você deseja suportar
  ensure_installed = { "lua", "python", "javascript", "html", "css" }, -- Adicione ou remova linguagens

  -- Instala parsers de forma assíncrona
  sync_install = false,

  -- Ativa o destaque de sintaxe baseado no Treesitter
  highlight = {
    enable = true,              -- Ativar o destaque de sintaxe
    additional_vim_regex_highlighting = false, -- Evitar que regex do Vim interfira
  },

  -- Ativa funcionalidades de indentação com base no Treesitter
  indent = {
    enable = true
  },

  -- Suporte a folding
  fold = {
    enable = true,
    disable = { "python" }, -- Exemplos de linguagens nas quais você deseja desativar
  },

  -- TextObjects: Configuração adicional, opcional
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },

  -- Playground: Ferramenta opcional para inspecionar a árvore de sintaxe
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounce time para atualizações
    persist_queries = false, -- Queries persistentes em múltiplas sessões
  },
}
end


return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- Garante que o parser seja atualizado automaticamente
  event = { "BufReadPost", "BufNewFile" }, -- Carrega o plugin apenas quando necessário
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects', -- Opcional: Suporte a textobjects via treesitter
    'nvim-treesitter/playground', -- Opcional: Playground para inspecionar a árvore de sintaxe
  },
}

