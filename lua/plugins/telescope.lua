return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- 常用快捷鍵
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "搜尋檔案" })
		vim.keymap.set("n", "<leader>fc", builtin.live_grep, { desc = "搜尋文字" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "切換 buffer" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "搜尋說明" })
		vim.keymap.set("n", "/", builtin.current_buffer_fuzzy_find, { desc = "當前檔案搜尋" })
	end,
}
