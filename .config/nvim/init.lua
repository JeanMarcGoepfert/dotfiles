-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd('syntax enable')
vim.cmd('syntax on')

vim.opt.termguicolors = true
vim.opt.background = "dark"
-- vim.opt.clipboard = "unnamed" -- copy to system clipboard
vim.opt.showmode = false
vim.opt.number = true
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.history = 50
vim.opt.statusline = vim.opt.statusline + "%F"
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.autowrite = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.backspace = "2"
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.modelines = 0
vim.opt.modelines = 0
vim.opt.ttyfast = true
vim.opt.scrolloff = 5
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.rtp = vim.opt.rtp + "~/.fzf"
vim.opt.shell = "/bin/sh"
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false

vim.g.javascript_enable_domhtmlcss = 1
vim.g.NERDTreeDirArrows = 0
vim.g.NERDTreeShowHidden = 1
vim.g.lightline = { colorscheme = 'solarized' }

vim.api.nvim_set_keymap("n", "<Leader>b", ":bp<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>n", ":bn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>f", ":NERDTreeFind<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>h", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>j", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>k", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>l", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>t", ":NERDTree<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>p", ":FZF<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>r", ":redo<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>s", ":vs<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>v", ":sp<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "jK", "<esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "Jk", "<esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "JK", "<esc>", { noremap = true })

-- :FM to run Neoformat
vim.api.nvim_create_user_command('FM', "Neoformat", {bang = true})

-- remove trailing white space
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*" }, command = [[%s/\s\+$//e]], })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" }
  },
  -- Configure any other settings here. See the documentation for more details.
  install = { colorscheme = { "solarized8" } },
  -- automatically check for plugin updates
  -- checker = { enabled = true },
})

local cmp = require('cmp')

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }),
})

-- LSP configuration
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md

local lsp_config = require('lspconfig'),
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "tsserver" },
  handlers = {
    function(server_name)
      lsp_config[server_name].setup({})
    end,
    ['tsserver'] = function()
      lsp_config.tsserver.setup({
        capabilities = lsp_capabilities,
        settings = {
          completions = {
            completeFunctionCalls = true
          }
        }
      })
    end
  },
})

