local function setup_breadcrumber()
  require("breadcrumbs").setup {
    active = true,
  }
end

return {
  "LunarVim/breadcrumbs.nvim",
  dependencies = {
    "SmiteshP/nvim-navic"
  },

  config = setup_breadcrumber
}
