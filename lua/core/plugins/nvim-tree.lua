-- lua/core/plugins/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  version = "*", -- ou use a versão mais recente com `version = false`
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Toda a sua configuração do nvim-tree vai aqui dentro
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
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

      actions = {
        open_file = {
          quit_on_open = false, -- Mantém o nvim-tree aberto após abrir um arquivo
          resize_window = true,
        },
      },
    })
  end
}
