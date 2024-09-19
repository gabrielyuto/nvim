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

-- Autocomando para acionar a função em CursorHold e CursorHoldI
api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
  pattern = "*.*",
  callback = highlight_word_under_cursor
})

-- Autocomando para salvar alteracoes automaticamente
api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  pattern = '*.*',
  command = 'update'
})

-- Define um autocmd para chamar Neoformat antes de salvar o arquivo
vim.api.nvim_create_autocmd("BufWritePre", {
  group = fmt_group,
  pattern = "*",
  command = "undojoin | Neoformat",
})
