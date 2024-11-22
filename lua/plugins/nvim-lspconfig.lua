return {
  "neovim/nvim-lspconfig",
  config = function()
        local lspconfig = require("lspconfig")
               -- Configuração do Dart Language Server (dartls)
        lspconfig.dartls.setup {
         cmd = { "fvm", "flutter", "dart", "language-server" },
         on_attach = function(client, bufnr)
                -- Mapeamentos úteis para trabalhar com LSP
                local opts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
            settings = {
                dart = {
                    enableSdkFormatter = true, -- Usa o formatador oficial do Dart SDK
                },
            },
        }
    end,
}
