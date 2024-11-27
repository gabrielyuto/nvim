local function setup_mason_nvim_dap()
  require("mason-nvim-dap").setup({
    ensure_installed = { "python", "node2", "chrome" },
    automatic_installation = true,
  })
end

return {
  'jay-babu/mason-nvim-dap.nvim',
  config = setup_mason_nvim_dap
}
