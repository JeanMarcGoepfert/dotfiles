return {
  -- the colorscheme should be available when starting Neovim
  {
    "lifepillar/vim-solarized8",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme solarized8]])
    end,
  },
  {'sbdchd/neoformat'},
  { "rking/ag.vim" },
  { "junegunn/fzf" },
  { "itchyny/lightline.vim" },
  { "pangloss/vim-javascript" },
  { "othree/html5.vim" },
  { "scrooloose/nerdtree" },
  { "mxw/vim-jsx" },
  { "Raimondi/delimitMate" },
  { "easymotion/vim-easymotion" },
  { "leafgarland/typescript-vim" },
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-buffer'},
  {'L3MON4D3/LuaSnip'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'elixir-lsp/elixir-ls'},
  {'nvim-treesitter/nvim-treesitter'}
}
