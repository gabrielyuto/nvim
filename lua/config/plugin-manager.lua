local lazy = require 'lazy';

local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { 
      "nvim-tree/nvim-web-devicons" 
    },
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
  },
  {
    "folke/tokyonight.nvim"
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  {
    "kilavila/nvim-bufferlist"
  },
  {
    "numToStr/Comment.nvim"
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 
      'nvim-lua/plenary.nvim' 
    }
  },
  {
    "folke/trouble.nvim"
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
    },
  },
  {
    'akinsho/toggleterm.nvim',
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 
      'nvim-tree/nvim-web-devicons' 
    },
  },
  {
    'sbdchd/neoformat',
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { 
      "nvim-treesitter/nvim-treesitter" 
    },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { 
      "rafamadriz/friendly-snippets" 
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { 
      "williamboman/mason.nvim", 
      "neovim/nvim-lspconfig" 
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path"
    },
  },
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = true,
  }
}

lazy.setup(plugins)
