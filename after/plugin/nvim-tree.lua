local nvim_tree = require "nvim-tree";

nvim_tree.setup({
   -- Opções gerais
   disable_netrw = true,         -- Desativa netrw (recomendado)
   hijack_netrw = true,          -- Substitui netrw
   hijack_cursor = true,         -- Move o cursor para o arquivo ao abrir
   update_cwd = true,            -- Atualiza o diretório atual

   -- Visualização
   view = {
       width = 30,               -- Largura do painel
       side = 'left',            -- Posição: left, right
       number = false,           -- Exibe números na lateral
       relativenumber = false,   -- Exibe números relativos
   },

   -- Renderização
   renderer = {
      highlight_git = true,     -- Destaca arquivos git
      icons = {
        show = {
          git = true,       -- Exibe ícones de git
          folder = true,    -- Exibe ícones de pasta
          file = true,      -- Exibe ícones de arquivo
          folder_arrow = true,
        },
      },
   },

   -- Sistema de arquivos
   filters = {
       dotfiles = false,         -- Exibe arquivos ocultos
   },

   -- Atualizações automáticas
   git = {
       enable = true,
       ignore = false,
   },
})
