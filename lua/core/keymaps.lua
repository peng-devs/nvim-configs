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
vim.keymap.set(
  'v',
  'Y',
  -- 將選取的文字通過管道傳給 iconv 轉換為 UTF-16LE，然後再傳給 clip.exe
  ':w !iconv -f UTF-8 -t UTF-16LE | clip.exe<cr><cr>',
  {
    noremap = true,
    silent = true,
    desc = 'Copy selected text to Windows clipboard (UTF-8 compatible)'
  }
)
vim.keymap.set(
  'n',
  'P',
  ':read !wsl_paste_from_windows.sh<CR>', -- 透過 :read ! 執行外部腳本並將其輸出插入
  {
    noremap = true,
    silent = true,
    desc = 'Paste from Windows clipboard via shell script'
  }
)

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- 套件管理
vim.keymap.set("n", "<leader>pm", ":Lazy<cr>", { desc = "Open Package Manager" })

-- 記錄關閉的 buffer
local closed_buffers = {}

vim.api.nvim_create_autocmd("BufDelete", {
	callback = function (ev)
    local bufname = vim.api.nvim_buf_get_name(ev.buf)
    if bufname ~= "" then
      table.insert(closed_buffers, 1, bufname)
      print("Save closed buffer")
    end
  end
})

-- 還原最後關閉的 buffer
vim.keymap.set("n", "<leader>X", function()
  if #closed_buffers > 0 then
    local last = table.remove(closed_buffers, 1)
    vim.cmd("edit " .. vim.fn.fnameescape(last))
    print("Reopen buffer")
  else
    print("No closed buffer")
  end
end, { noremap = true })

