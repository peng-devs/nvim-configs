# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 架構概覽

這是一個簡潔的 Neovim 配置，採用模組化結構：

- `init.lua` - 主要入口點，設定 leader key 並載入模組
- `lua/settings.lua` - 編輯器設定和選項
- `lua/keymaps.lua` - 按鍵映射定義

## 配置重新載入

使用 `<leader>sv` 重新載入配置，或手動執行：
```lua
dofile(vim.fn.stdpath('config') .. '/init.lua')
```

## 主要設計決策

- **Leader Key**: 空格鍵 (`<space>`)
- **縮排**: 2 空格，不使用 tab
- **行號**: 相對行號 + 絕對行號
- **搜尋**: 智慧大小寫敏感
- **Cursor**: 始終保持在螢幕中央 (`scrolloff = 999`)
- **透明背景**: 移除背景色以支援終端透明度

## 按鍵映射系統

配置使用一致的按鍵映射模式：
- `<leader>q/Q` - 退出相關操作
- `<leader>x` - 關閉 buffer
- `<leader>j/k` - buffer 導航
- `<leader>w` - window 操作前綴
- `J/K` - 快速上下捲動 (`<C-d>/<C-u>`)
- `B/E` - 行首/行尾移動
- `U` - Redo (`<C-r>`)

## WSL 特定設定

- Visual mode 中的 `Y` 映射到 `clip.exe` 用於 Windows 剪貼簿整合