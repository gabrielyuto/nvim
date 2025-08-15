local options = vim.opt
local commands = vim.cmd

-- Configurações básicas do editor
options.number = true -- Ativa números de linha
options.mouse = "a" -- Suporte a mouse em todos os modos
options.hidden = true -- Permite esconder buffers sem salvar
options.cmdheight = 2 -- Altura da linha de comando para evitar mensagens de um único espaço
options.updatetime = 100 -- Tempo de atualização para operações assíncronas
options.termguicolors = true -- Suporte a cores do terminal
options.encoding = "utf-8" -- Codificação como UTF-8

-- Configurações de pesquisa
options.incsearch = true -- Pesquisa incremental
options.ignorecase = true -- Ignora maiúsculas/minúsculas em buscas
options.smartcase = true -- Buscas distinguem maiúsculas/minúsculas se houver entrada de maiúsculas

-- Configurações de visualização
options.scrolloff = 8 -- Mantém 8 linhas acima/abaixo do cursor durante a rolagem
options.signcolumn = "yes" -- Exibe a coluna de sinais (útil para linting e git)
options.splitright = true -- Divide verticalmente à direita
options.splitbelow = true -- Divide horizontalmente abaixo

-- Configurações de arquivo
options.autoread = true -- Recarrega arquivos alterados externamente
options.backup = false -- Desativa a criação de arquivos de backup
options.writebackup = false -- Desativa backup ao escrever

-- Configurações de indentação
options.expandtab = true -- Usa espaços em vez de tabs
options.tabstop = 2 -- Um tab é igual a 2 espaços
options.shiftwidth = 2 -- Indentação de 2 espaços para cada nível
options.softtabstop = 2 -- Um tab interrompe após 2 espaços
options.smarttab = true -- Tab inteligente para completar espaços
options.smartindent = true -- Indentação inteligente baseada em sintaxe

-- Ativação de recursos de syntax e filetype
commands('syntax on') -- Ativa o realce de sintaxe
commands('filetype on') -- Ativa a detecção de tipo de arquivo
commands('filetype plugin on') -- Ativa plugins de tipo de arquivo
commands('filetype indent on') -- Ativa scripts de indentação de tipo de arquivo
--commands([[colorscheme tokyonight]])


-- Defina o método de fold
vim.o.foldmethod = 'indent'  -- Usa a indentação para folding
vim.o.foldlevel = 99         -- Garante que o código não seja recolhido ao abrir um arquivo
vim.o.foldenable = true      -- Habilita o folding por padrão

vim.diagnostic.config({
  virtual_text = false, -- Desativa o texto flutuante
  signs = true,         -- Mantém ícones nas laterais
  underline = false,     -- Destaca erros no código
  severity_sort = true, -- Ordena diagnósticos por severidade
  update_in_insert = false
})
