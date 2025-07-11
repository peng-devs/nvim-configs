return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for git operations
	},
	config = function()
		require("claude-code").setup({
			window = {
				split_ratio = 0.4, -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
				position = "vertical rightbelow",
			},

			keymaps = {
				toggle = {
					normal = "<C-p>", -- Normal mode keymap for toggling Claude Code, false to disable
					terminal = "<C-p>", -- Terminal mode keymap for toggling Claude Code, false to disable
				},
			},
		})

		vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
	end,
}
