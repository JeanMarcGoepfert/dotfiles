-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('config')
require('keybindings')

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins/spec" }
  },
  install = { colorscheme = { "solarized8" } },
  -- automatically check for plugin updates
  -- checker = { enabled = true },
})

require('plugins/config')
