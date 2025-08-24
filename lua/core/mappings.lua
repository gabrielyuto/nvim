local api = vim.api

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Normal Mode
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'List buffers' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Find help' })
map('n', '<leader>bb', '<cmd>BufferListOpen<cr>', { desc = 'Buffer list' })
map('n', '<C-/>',      '<cmd>:ToggleTerm direction=float<cr>', { desc = 'Floating Terminal'})
map('n', '<leader>tv', '<cmd>:ToggleTerm size=70 direction=vertical<cr>', { desc = 'Vertical Terminal' })
map('n', '<leader>th', '<cmd>:ToggleTerm size=20 direction=horizontal<cr>', {desc = 'Horizontal Terminal'})
map('n', '<leader>tt', '<cmd>:ToggleTerm direction=tab<cr>', { desc = 'Tab Terminal'})
map('n', '<leader>e',  '<cmd>:NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<leader>r',  '<cmd>:NvimTreeRefresh<cr>', { noremap = true, silent = true })
map('n', '<leader>n',  '<cmd>:NvimTreeFindFile<cr>', { noremap = true, silent = true })
map('n', '<leader>da', '<cmd>lua require("dapui").eval()<cr>', { desc = 'DAP-UI' })
map('n','<leader>lg',  '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
map('n', '<Esc>',      '<cmd>:nohlsearch<cr>', { desc = 'exit find term' })

-- Terminal Mode
map('t', '<C-/>', '<C-\\><C-n>:ToggleTerm<cr>', { desc = 'Hide Terminal' })
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Change from Terminal to Normal mode' })

-- Visual Mode
map('v', '<C-c>', ':w !pbcopy<CR><Esc>', { desc = 'Copy to transfer area'})

-- Visual-only Mode
map('x', '<C-i>', 'I', { noremap = true, silent = true })

-- DAP
vim.fn.sign_define('DapBreakpoint', { text='🛑', texthl='', linehl='', numhl='' })
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)

-- Atalhos para comandos LazyGit
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lc', ':LazyGitConfig<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lf', ':LazyGitFilter<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lcf', ':LazyGitFilterCurrentFile<CR>', { noremap = true, silent = true })

-- vim-rspec mappings
map('n', '<leader>rs', '<cmd>:call RunCurrentSpecFile()<cr>', { desc = 'Find files' })
map('n', '<leader>rn', '<cmd>:call RunNearestSpec()<cr>', { desc = 'Live grep' }) 
map('n', '<leader>rl', '<cmd>:call RunLastSpec()<cr>', { desc = 'List buffers' })
map('n', '<leader>ra', '<cmd>:call RunAllSpecs()<cr>', { desc = 'Find help' })
