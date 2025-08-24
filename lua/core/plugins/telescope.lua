-- lua/core/plugins/telescope.lua

return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      load_extensions = { 'lazygit' },
    })
  end
}