return {
	"olimorris/persisted.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	lazy = false,
	config = function()
		require("persisted").setup({
			save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
			autoload = true,
			use_git_branch = true,
			telescope = {
				reset_prompt = true,
			},
		})

		-- Telescope integration
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope persisted<CR>", { desc = "搜尋 sessions" })
	end,
}
