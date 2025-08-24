-- lua/core/plugins/trouble.lua

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('trouble').setup({
      mode = "workspace_diagnostics",
      auto_open = false,
      auto_close = true,
      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
      },
    })
  end
}

