-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
--
--
-- Insert mode: move line up/down pakai Alt + panah (tanpa keluar dari insert mode)
vim.keymap.set("i", "<A-Up>", "<C-o>:m .-2<CR><C-o>==", { desc = "Move line up (Insert mode)" })
vim.keymap.set("i", "<A-Down>", "<C-o>:m .+1<CR><C-o>==", { desc = "Move line down (Insert mode)" })
-- Normal mode: move line up/down pakai Alt + panah
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })

-- Visual mode: move block up/down pakai Alt + panah
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
