-- lua/core/plugins/nvim-ts-autotag.lua

return {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup({
      event = "InsertEnter",
    })
  end
}
