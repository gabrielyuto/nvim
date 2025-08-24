-- lua/core/plugins/lualine.lua

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            icon = '',
            path = 3, -- Exibe o caminho relativo 1 | Caminho absoluto 3
            shorting_target = 40
          }
        },
        lualine_x = {
          'encoding', 
          'fileformat', 
          {
            'filetype',
            colored = true,  -- Habilita a coloração do ícone baseado no tipo do arquivo
            icon_only = false,
          }
        },
        lualine_y = {'progress'},
        lualine_z = {
          {
            'location',
          },
          {
            'os.date("%H:%M")',
            icon = '⏰',  -- Ícone de relógio como emoji
            padding = { right = 1 },  -- Ajusta o espaçamento conforme necessário
          }
        }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
      })
  end
}