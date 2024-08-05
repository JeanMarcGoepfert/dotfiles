-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- use clipboard register
vim.api.nvim_set_option("clipboard","unnamed")

-- remove trailing white space
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*" }, command = [[%s/\s\+$//e]], })

-- :CP to copy current path to clipboard
vim.api.nvim_create_user_command("CP", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
