local api = vim.api

local function highlight_word_under_cursor()
  local line = vim.fn.getline(".")
  local col = vim.fn.col(".") - 1
  local char_under_cursor = line:sub(col, col)

  if not string.match(char_under_cursor, "[%p%s]") then
    local word = vim.fn.expand("<cword>")
    vim.cmd("match Search /\\V\\<" .. word .. "\\>/")
  else
    vim.cmd("match none")
  end
end

-- Autocomando para salvar alteracoes automaticamente
api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = '*.*',
  command = 'silent update'
})

