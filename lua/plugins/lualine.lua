return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox-material",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function()
							return " "
						end,
						padding = 0, -- 調整寬度
					},
				},
				lualine_b = {
					{
						function()
							return vim.fn.nr2char(0xe0a0) -- 只顯示 git branch icon
						end,
					},
					{
						function()
							-- 取得 git 狀態
							local git_status = vim.b.gitsigns_status_dict
							if
								git_status
								and (git_status.added or 0)
										+ (git_status.changed or 0)
										+ (git_status.removed or 0)
									> 0
							then
								return vim.fn.nr2char(0xf440) -- 有修改時顯示黃點
							end
							return "" -- 沒有修改時不顯示
						end,
						color = { fg = "#fabd2f" }, -- gruvbox 黃色
						padding = { left = 0, right = 1 }, -- 調整寬度
					},
				},
				lualine_c = {
					{
						"filename",
						path = 0, -- 0 = 只顯示檔名
						symbols = {
							modified = " ●", -- 檔案修改時的標記
							readonly = " ", -- 唯讀檔案標記
							unnamed = "[No Name]", -- 未命名檔案
						},
						fmt = function(str)
							local filename = vim.fn.expand("%:t")
							-- 檢查是否為 SvelteKit 特殊檔案
							if filename:match("^%+") then -- 以 + 開頭的檔案
								-- 多顯示一層路徑
								local parent = vim.fn.expand("%:h:t")
								if parent ~= "" and parent ~= "." then
									return parent .. "/" .. filename
								end
							end
							return str
						end,
					},
				},
				lualine_x = { "diagnostics" },
				lualine_y = { "filetype" },
				lualine_z = {
					{
						function()
							local current_line = vim.fn.line(".")
							local total_lines = vim.fn.line("$")
							return string.format("%d:%d", current_line, total_lines)
						end,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
