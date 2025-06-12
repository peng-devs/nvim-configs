# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 執行原則

**計劃導向執行模式：**

1. **制定計劃書**：任何任務開始前，必須先制定詳細的執行計劃書，列出所有步驟
2. **嚴格遵循**：必須嚴格按照計劃書的順序和內容執行，不可偏離或跳躍步驟
3. **逐步確認**：計劃書中的每個步驟在執行前都必須：
   - 詳細說明該步驟的目的和方法
   - 等待明確的執行許可
   - 獲得確認後才可進行
4. **步驟完成報告**：每個步驟完成後，需要報告執行結果

**執行流程：**
```
制定計劃書 → 討論確認計劃 → 逐步執行：
  ├─ 說明步驟 N
  ├─ 等待確認
  ├─ 執行步驟 N
  ├─ 報告結果
  └─ 繼續下一步驟
```

**絕對禁止**：
- 未制定計劃書就直接執行
- 跳過步驟確認程序
- 偏離已確認的計劃書內容
- **連續執行多個步驟而不等待用戶確認**
- **在用戶回應確認之前就開始執行下一個步驟**

**強制執行規則**：
- 每次只能執行一個步驟
- 每個步驟執行前必須明確詢問：「請確認我可以執行這個步驟嗎？」
- 必須等待用戶明確回應「可以」、「確認」或類似的同意詞語
- 絕對不能在問完問題後直接執行，必須等待回應
- 如果用戶沒有明確同意，不可執行該步驟

## 配置重新載入

使用 `<leader>sv` 重新載入配置，或手動執行：
```lua
dofile(vim.fn.stdpath('config') .. '/init.lua')
```

## 檔案結構

```
~/.config/nvim/
├── init.lua                # 主入口，設定 leader key 並載入 core 模組
├── lua/
│   ├── core/              # 核心配置模組
│   │   ├── options.lua    # 編輯器選項 (替代舊的 settings.lua)
│   │   └── keymaps.lua    # 按鍵映射定義
│   └── plugins/           # 套件管理 (使用 lazy.nvim)
│       └── init.lua       # lazy.nvim 初始化設定
├── docs      
│   └── NVIM_IDE_PLAN.md   # IDE 升級計劃
└── CLAUDE.md              # 此說明檔
```

## 核心設計原則

- **Leader Key**: 空格鍵 (`<space>`)
- **縮排**: 2 空格，使用 `expandtab`
- **行號**: 相對行號 + 絕對行號，`cursorline` 高亮
- **搜尋**: 智慧大小寫敏感 (`ignorecase` + `smartcase`)
- **捲動**: 游標永遠居中 (`scrolloff = 999`)
- **透明背景**: 移除 Normal 高亮背景以支援終端透明度

## 按鍵映射架構

### 管理相關
- `<leader>sv` - 重新載入配置
- `<leader>q/Q` - 退出 (正常/強制)
- `<leader>x` - 關閉當前 buffer

### Buffer/Window 導航
- `<leader>j/k` - 下一個/上一個 buffer
- `<leader>\`` - 切換到上一個 buffer
- `<leader><tab>` - 下一個 window
- `<leader>w` - window 操作前綴 (`<C-w>`)

### 編輯增強
- `J/K` - 快速向下/向上捲動 (映射到 `<C-d>/<C-u>`)
- `B/E` - 行首/行尾移動 (映射到 `^/$`)
- `U` - Redo (映射到 `<C-r>`)
- `j/k` - 處理自動換行 (映射到 `gj/gk`)

## WSL 整合

- Visual mode 中的 `Y` 映射到 `clip.exe` 實現 Windows 剪貼簿整合
- 支援 WSL 環境下的檔案操作

## 套件管理

- **已完成**: lazy.nvim 套件管理系統
- **按鍵映射**: `<leader>pm` - 開啟套件管理器

## 開發中功能

參考 `NVIM_IDE_PLAN.md` 了解正在規劃的 IDE 功能升級，包括：
- ✅ lazy.nvim 套件管理
- ❌ LSP 支援 (mason + lspconfig)
- ❌ 自動完成 (nvim-cmp)
- ❌ 檔案搜尋 (telescope)
- ❌ 語法高亮 (treesitter)
