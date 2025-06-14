-- lua/plugins/lsp.lua
return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"saghen/blink.cmp", -- 確保 blink.cmp 先載入
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- 取得 blink.cmp 的 capabilities
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- LSP 按鍵綁定
			local on_attach = function(_, bufnr)
				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end
				local opts = { noremap = true, silent = true }

				buf_set_keymap("n", "<leader>l", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				buf_set_keymap("n", "<leader>L", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

				-- 文檔
				buf_set_keymap("n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

				-- 重構
				buf_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
				buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

				-- 診斷
				buf_set_keymap("n", "<leader>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
				buf_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
			end

			-- 設定診斷符號
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- 診斷設定
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = true,
				},
			})

			-- 手動設定每個 LSP
			-- Lua
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})

			-- TypeScript
			lspconfig.ts_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- 其他 LSP
			local servers = { "svelte", "html", "cssls", "jsonls", "yamlls", "sqlls", "bashls" }
			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			-- Telescope 診斷查詢快捷鍵
			vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "搜尋診斷" })
		end,
	},
}
