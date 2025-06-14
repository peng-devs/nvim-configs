-- lua/plugins/comment.lua
return {
	"numToStr/Comment.nvim",
	opts = {
		-- 基本設定
		padding = true,
		sticky = true,
		ignore = nil,

		-- 切換設定
		toggler = {
			line = "<leader>/", -- 行註解切換
		},

		-- 操作設定
		opleader = {
			line = "<leader>/", -- 行註解切換
		},

		-- 啟用所有模式
		mappings = {
			basic = true,
			extra = true,
		},

		-- pre-hook 讓 TypeScript 和 JSX 正確註解
	},
}
