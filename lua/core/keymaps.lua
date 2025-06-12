-- quick config
function reload_config()
  dofile(vim.fn.stdpath('config') .. '/init.lua')
end
vim.keymap.set("n", "<leader>sv", reload_config, { noremap = true, silent = true })

-- buffer/window controll
vim.keymap.set("n", "<leader>q", ":qa<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Q", ":qa!<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":bd<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", ":bn<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", ":bp<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>`", ":b#<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><tab>", "<c-w>w", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", "<c-w>", { noremap = true, silent = true })

-- navigation/editing
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
vim.keymap.set("n", "J", "<c-d>", { noremap = true, silent = true })
vim.keymap.set("n", "K", "<c-u>", { noremap = true, silent = true })
vim.keymap.set("v", "J", "<c-d>", { noremap = true, silent = true })
vim.keymap.set("v", "K", "<c-u>", { noremap = true, silent = true })
vim.keymap.set("n", "B", "^", { noremap = true, silent = true })
vim.keymap.set("n", "E", "$", { noremap = true, silent = true })
vim.keymap.set("n", "U", "<c-r>", { noremap = true, silent = true })
vim.keymap.set("v", "B", "^", { noremap = true, silent = true })
vim.keymap.set("v", "E", "$", { noremap = true, silent = true })
vim.keymap.set("v", "Y", ":w !clip.exe<cr><cr>", { noremap = true, silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
