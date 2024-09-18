local function setup_tokyonight()
  vim.cmd([[colorscheme tokyonight]])
end

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = setup_tokyonight
}

