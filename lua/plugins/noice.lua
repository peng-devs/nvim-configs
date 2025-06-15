return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},

	config = function()
		require("notify").setup({
			render = "compact",
			stages = "static", -- 改為 static，沒有動畫
			timeout = 2500,
			top_down = false, -- 從下往上顯示
		})

		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = false,
				},
				hover = {
					enabled = true,
					silent = false,
				},
				signature = {
					enabled = true,
					auto_open = {
						enabled = false, -- 避免和 blink.cmp 衝突
					},
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false,
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},

			-- 路由設定
			routes = {
				-- 隱藏寫入訊息
				{
					filter = {
						event = "msg_show",
						kind = "",
						any = {
							{ find = "written" },
							{ find = "undo" },
							{ find = "redo" },
							{ find = "change" },
							{ find = "line less" },
							{ find = "fewer lines" },
							{ find = "more line" },
						},
					},
					opts = { skip = true },
				},

				-- 隱藏搜尋計數
				{
					filter = {
						event = "msg_show",
						kind = "search_count",
					},
					opts = { skip = true },
				},
			},
		})

		vim.keymap.set("n", "<leader>fn", function()
			require("telescope").extensions.noice.noice()
		end, { desc = "訊息歷史" })
	end,
}
