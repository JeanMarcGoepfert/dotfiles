local cmp = require('cmp')
local lsp_zero = require('lsp-zero')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'},
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }),
})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)


local lsp_config = require('lspconfig'),
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "tsserver", "elixirls", "gopls" },
  handlers = {
    function(server_name)
      lsp_config[server_name].setup({})
    end,
    require('lspconfig').elixirls.setup{
      cmd = { "~/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" };
    }
  },
})

require('nvim-treesitter.configs').setup({
  ensure_installed = { "lua" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
})
