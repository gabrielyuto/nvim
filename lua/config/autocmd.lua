local api = vim.api

-- Autocomando para salvar alteracoes automaticamente
api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = '*.*',
  command = 'silent update'
})

