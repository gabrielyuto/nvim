local lspconfig = require "lspconfig";
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- CONFIGURACAO DART LSP
lspconfig.dartls.setup {
  capabilities = capabilities,
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  root_dir = lspconfig.util.root_pattern("pubspec.yaml"),
  init_options = {
    closingLabels = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
    },
  },
  on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    local buf_set_keymap = vim.api.nvim_buf_set_keymap

    buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  handlers = {
    ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
      result.diagnostics = vim.tbl_filter(function(diagnostic)
        -- Exclui diagnósticos do tipo HINT
        return diagnostic.severity ~= vim.diagnostic.severity.HINT
      end, result.diagnostics)
      vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
    end,
  },
}


-- CONFIGURACAO LUA LSP
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

-- CONFIGURACAO RUBY LSP
lspconfig.solargraph.setup {
 capabilities = capabilities,
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  init_options = {
    formatting = true,
  },
  settings = {
    solargraph = {
      diagnostics = true,  
    }
  },
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  end,
}

-- CONFIGURACAO JAVASCRIPT E TYPESCRIPT
lspconfig.ts_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Desativar a formatação pelo tsserver (opcional, se for usar outro formatador)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      },
    },
  },
}

