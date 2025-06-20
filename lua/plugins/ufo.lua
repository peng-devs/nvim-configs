-- lua/plugins/ufo.lua
return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		-- 設定 folding
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- 使用 ufo 提供的快捷鍵
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)

		-- 設定 ufo
		require("ufo").setup({
			close_fold_kinds_for_ft = {
				default = {
					"comment",
					"imports",
				},
			},
		})
	end,
}
