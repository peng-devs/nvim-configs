-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- 自動安裝的語言
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "typescript",
        "javascript",
        "html",
        "css",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "sql",
        "svelte",
        "bash",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
      },
      
      -- 自動安裝 parsers
      auto_install = true,
      
      -- 語法高亮
      highlight = {
        enable = true,
        -- 關閉 Vim 原生的 regex 高亮
        additional_vim_regex_highlighting = false, 
      },
      
      -- 縮排
      indent = {
        -- 啟用基於 Treesitter 的智慧縮排
        enable = true,
      },

      -- 摺疊程式碼
      fold = {
        enable = true,
        disable = { "yaml" },  -- 某些語言停用摺疊
      },
      
      -- 增量選擇
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = false,
          node_incremental = "=",
          scope_incremental = false,
          node_decremental = "-",
        },
      },
    })
  end,
}
