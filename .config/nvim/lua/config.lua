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

