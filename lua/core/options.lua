-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 500

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- show line number
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = "number"

-- keep the cursor in the middle
vim.o.scrolloff = 999

-- enhance search function
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.magic = true

-- improve tab
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- styling
vim.o.termguicolors = true
vim.g.have_nerd_font = true
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")

-- disable for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
