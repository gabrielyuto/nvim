-- INSTALL LAZY
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- CONFIGS
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- ********** PLUGINS **********
require("lazy").setup({
  spec = {
    { import = "core.plugins" },
    { import = "core.themes" },
  }
})


-- local plugins = {
--   {
--     "kilavila/nvim-bufferlist"
--   },
--   {
--     "numToStr/Comment.nvim"
--   },
--   {
--     'sbdchd/neoformat',
--   },
--   {
--     "L3MON4D3/LuaSnip",
--     dependencies = { 
--       "rafamadriz/friendly-snippets" 
--     },
--   },
--   {
--     "williamboman/mason-lspconfig.nvim",
--     dependencies = { 
--       "williamboman/mason.nvim", 
--       "neovim/nvim-lspconfig" 
--     },
--   },
--   {
--     "mfussenegger/nvim-dap",
--     dependencies = {
--       "rcarriga/nvim-dap-ui",
--       "williamboman/mason.nvim",
--       "jay-babu/mason-nvim-dap.nvim", 
--     },
--   },
--   {
--     'hrsh7th/nvim-cmp',
--     dependencies = {
--       "neovim/nvim-lspconfig",
--       "hrsh7th/cmp-nvim-lsp", -- Integração com o LSP
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-path",
--       "hrsh7th/cmp-cmdline",
--       "onsails/lspkind-nvim", -- Ícones bonitos nas sugestões
--       "L3MON4D3/LuaSnip",     -- Suporte a snippets
--       "saadparwaiz1/cmp_luasnip"
--     }
--   },
--   {
--     'mfussenegger/nvim-jdtls',
--   },
--   {
--     "thoughtbot/vim-rspec"
--   },
--   --{
--    -- "jgdavey/tslime.vim"
--   --}
-- }


