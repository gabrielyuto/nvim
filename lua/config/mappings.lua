local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Normal Mode
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'List buffers' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Find help' })
map('n', '<leader>bb', '<cmd>BufferListOpen<cr>', { desc = 'Buffer list' })
map('n', '<C-/>',  '<cmd>:ToggleTerm direction=float<cr>', { desc = 'Floating Terminal'})
map('n', '<leader>v',  '<cmd>:ToggleTerm size=70 direction=vertical<cr>', { desc = 'Vertical Terminal' })
map('n', '<leader>h',  '<cmd>:ToggleTerm size=20 direction=horizontal<cr>', {desc = 'Horizontal Terminal'})

-- Terminal Mode
map('t', '<C-/>', '<C-\\><C-n>:ToggleTerm<cr>', { desc = 'Hide Terminal' })
