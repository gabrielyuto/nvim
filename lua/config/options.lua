local options  = vim.opt
local commands = vim.cmd

options.number = true -- Enable line numbers
options.tabstop = 2 -- Set tab width to 2 spaces
options.softtabstop = 2
options.shiftwidth = 2
options.expandtab = true
options.smarttab = true
options.smartindent = true -- Smart indentation
options.hidden = true -- Hide the current buffer when a new file is opened
options.incsearch = true -- Enable incremental search
options.ignorecase = true -- Ignore case in search unless uppercase character is used
options.smartcase = true
options.scrolloff = 8 -- Set minimum number of lines to keep above and below the cursor
options.splitright = true
options.splitbelow = true
options.autoread = true -- Automatically reload files changed outside of Neovim
options.mouse = "a" -- Enable mouse support
options.signcolumn = "yes" -- Show sign column (useful for linting)
options.cmdheight = 2 -- Give more space for displaying messages
options.updatetime = 100 -- Set update time in milliseconds
options.encoding = "utf-8" -- Set encoding to UTF-8
options.backup = false -- Disable backup files
options.writebackup = false
options.termguicolors = true

commands('syntax on') -- Enable syntax highlight
commands('filetype on') -- Enable filetype detection and plugin/indent loading
commands('filetype plugin on')
commands('filetype indent on')
