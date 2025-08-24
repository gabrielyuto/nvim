-- lua/core/plugins/bufferline.lua

return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('bufferline').setup({
      options = {
        offsets = {
          {
            filetype = "NvimTree", -- Define que ele deve reconhecer o NvimTree
            text = "File Explorer", -- Texto opcional que aparece no bufferline ao lado do NvimTree
            highlight = "Directory",
            text_align = "left", -- Alinhamento do texto
            separator = true -- Se você deseja ter um separador entre o NvimTree e os buffers
          }
        },
        show_buffer_close_icons = true, -- Opcional: remove o ícone de fechar no buffer
        show_close_icon = true, -- Opcional: remove o ícone de fechar global
        separator_style = "thick" -- Opcional: estilo do separador entre os buffers
      }
    })
  end
}


