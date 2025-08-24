-- lua/core/plugins/toggleterm.lua

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20, -- Altura do terminal
      open_mapping = [[<c-/>]], -- Atalho para abrir/fechar o terminal
      hide_numbers = false, -- Ocultar números de linha no terminal
      shade_filetypes = {},
      shade_terminals = true, -- Aplicar sombreamento ao fundo do terminal
      shading_factor = '2', -- Grau de sombreamento
      start_in_insert = true, -- Começar no modo Insert
      insert_mappings = true, -- Atalhos de inserção
      terminal_mappings = true, -- Atalhos no modo Terminal
      persist_size = true, -- Manter o tamanho do terminal
      direction = 'horizontal', -- Direção do terminal ('horizontal', 'vertical', 'float')
      close_on_exit = true, -- Fechar o terminal ao sair
      shell = vim.o.shell, -- Usar o shell padrão do sistema
      float_opts = {
        border = 'curved', -- Borda da janela flutuante
        winblend = 3,
      }
    })
  end
}
