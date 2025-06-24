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

			-- See nvim-ufo setup
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

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
				settings = {
					typescript = {
						format = {
							enable = false, -- 讓 prettier 處理格式化
						},
						preferences = {
							preferTypeOnlyAutoImports = true,
						},
						suggest = {
							autoImports = true,
							completeFunctionCalls = true,
						},
					},
					javascript = {
						format = {
							enable = false,
						},
					},
				},
				commands = {
					OrganizeImports = {
						function()
							local params = {
								command = "_typescript.organizeImports",
								arguments = { vim.api.nvim_buf_get_name(0) },
								title = "",
							}
							vim.lsp.buf.execute_command(params)
						end,
						description = "Organize Imports",
					},
				},
				init_options = {
					plugins = {
						{
							name = "typescript-svelte-plugin",
							location = vim.fn.expand(
								"~/.local/share/nvim/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin"
							),
						},
					},
				},
			})

			-- Svelte
			lspconfig.svelte.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- 其他 LSP
			local servers = { "html", "cssls", "jsonls", "yamlls", "sqlls", "bashls" }
			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			-- Telescope 診斷查詢快捷鍵
			vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "搜尋診斷" })

			-- 手動整理 imports
			vim.keymap.set("n", "<leader>co", function()
				local filetype = vim.bo.filetype

				if
					filetype == "typescript"
					or filetype == "javascript"
					or filetype == "typescriptreact"
					or filetype == "javascriptreact"
				then
					-- TypeScript/JavaScript
					local params = {
						command = "_typescript.organizeImports",
						arguments = { vim.api.nvim_buf_get_name(0) },
					}
					vim.lsp.buf.execute_command(params)
				elseif filetype == "svelte" then
					-- Svelte 使用 code action
					vim.lsp.buf.code_action({
						context = {
							only = { "source.organizeImports" },
							diagnostics = {},
						},
						apply = true,
					})
				end
			end, { desc = "Organize Imports" })
		end,
	},
}
