# Neovim IDE 升級計劃

## 專案概覽
將現有的簡潔 Neovim 配置升級為功能完整的現代化 IDE，保持模組化結構和高效率。

## 目前配置狀態
- ✅ 基本編輯器設定 (行號、縮排、搜尋等)
- ✅ 自訂按鍵映射系統
- ✅ WSL 剪貼簿整合
- ✅ 套件管理器 (lazy.nvim)
- ❌ LSP 支援
- ❌ 自動完成
- ❌ 檔案導航

## 升級階段規劃

### 階段 1: 核心基礎設施 (高優先級)

#### 1.1 套件管理器 - lazy.nvim ✅ 已完成
**目標**: 建立現代化的套件管理基礎
- ✅ 安裝 lazy.nvim
- ✅ 設置 lazy loading 機制
- ✅ 建立模組化載入結構
- ✅ 新增 `<leader>pm` 套件管理介面

**檔案結構**:
```
lua/plugins/
├── init.lua              # lazy.nvim 初始化
├── lsp.lua              # LSP 相關套件
├── completion.lua       # 自動完成相關
├── ui.lua               # 介面相關套件
├── git.lua              # Git 整合套件
└── treesitter.lua       # 語法高亮
```

#### 1.2 LSP 系統 - mason.nvim + nvim-lspconfig
**目標**: 提供智能語言支援
- mason.nvim: 語言伺服器管理
- nvim-lspconfig: LSP 客戶端配置
- null-ls: 格式化和 linting

**功能**:
- 自動安裝語言伺服器
- 代碼跳轉 (go to definition/reference)
- 即時錯誤檢查
- 懸浮文檔
- 代碼格式化

#### 1.3 自動完成系統 - nvim-cmp
**目標**: 提供智能代碼補全
- nvim-cmp: 完成引擎
- 各種 completion sources
- luasnip: snippet 引擎

**功能**:
- LSP 代碼補全
- 檔案路徑補全
- 緩衝區單詞補全
- Snippet 展開

#### 1.4 模糊搜尋 - telescope.nvim
**目標**: 快速檔案和內容導航
- 檔案搜尋
- 內容搜尋 (live grep)
- LSP 符號搜尋
- 命令面板

#### 1.5 語法高亮 - nvim-treesitter
**目標**: 精確語法解析和高亮
- 語法高亮
- 代碼折疊
- 智能選取
- 縮排檢測

### 階段 2: 開發體驗增強 (中優先級)

#### 2.1 檔案管理 - nvim-tree
**目標**: 圖形化檔案瀏覽器
- 檔案樹側邊欄
- 檔案操作 (新增/刪除/重命名)
- Git 狀態顯示

#### 2.2 Git 整合
**目標**: 無縫版本控制體驗
- gitsigns.nvim: 行內 Git 狀態
- fugitive.vim: Git 命令整合
- 差異比較和合併


### 階段 3: 介面美化 (低優先級)

#### 3.1 狀態列 - lualine
**目標**: 資訊豐富的狀態列
- 檔案資訊
- Git 分支
- LSP 狀態
- 診斷資訊

#### 3.2 主題和美化
**目標**: 視覺體驗優化
- 選擇主題 (建議: catppuccin/tokyonight)
- 圖示支援 (nvim-web-devicons)
- 透明背景保持

## 目標檔案結構

```
~/.config/nvim/
├── init.lua                 # 主入口
├── lua/
│   ├── core/               # 核心配置
│   │   ├── options.lua     # 編輯器選項 (從 settings.lua 重構)
│   │   ├── keymaps.lua     # 按鍵映射 (重構現有)
│   │   └── autocmds.lua    # 自動命令
│   ├── plugins/            # 套件配置
│   │   ├── init.lua        # lazy.nvim 設置
│   │   ├── lsp.lua         # LSP 相關套件
│   │   ├── completion.lua  # 自動完成相關
│   │   ├── ui.lua          # 介面相關套件
│   │   ├── git.lua         # Git 整合套件
│   │   └── treesitter.lua  # 語法高亮
│   └── utils/              # 實用函數
│       └── helpers.lua
├── CLAUDE.md              # 專案說明 (現有)
└── NVIM_IDE_PLAN.md       # 此計劃書
```

## 按鍵映射規劃

### 新增 Leader 鍵組合
```lua
-- LSP 功能
<leader>l    -- LSP 前綴
<leader>lr   -- 重新命名
<leader>la   -- 代碼動作
<leader>lf   -- 格式化

-- 檔案操作
<leader>f    -- 檔案相關前綴
<leader>ff   -- 檔案搜尋 (telescope)
<leader>fg   -- 內容搜尋 (live grep)
<leader>fb   -- 緩衝區列表

-- Git 操作
<leader>g    -- Git 前綴
<leader>gs   -- Git 狀態
<leader>gc   -- Git 提交
<leader>gp   -- Git 推送

```

## 效能考量
- 使用 lazy loading 避免啟動時間過長
- 只載入當前語言所需的 LSP
- 適當的緩存策略
- 保持配置檔案模組化便於維護

## 兼容性
- 保持與現有按鍵映射的兼容
- WSL 環境特殊設置保留
- 透明背景設定維持

## 實施時程
1. **第 1 週**: 階段 1 (核心基礎設施)
2. **第 2 週**: 階段 2 (開發體驗增強)
3. **第 3 週**: 階段 3 (介面美化) + 優化調整

## 備份與回滾
- 在開始前創建配置備份
- 每個階段完成後創建 Git commit
- 保留回滾到簡潔配置的能力

---

**最後更新**: 2025-12-06
**狀態**: 計劃階段 ✅ | 實施階段 🚀 (1.1 套件管理器已完成)