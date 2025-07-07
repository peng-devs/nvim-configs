return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "eslint_d", "prettier" },
			typescript = { "eslint_d", "prettier" },
			svelte = { "eslint_d", "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },

			-- 其他
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 1000,
		},
		notify_on_error = true,
	},
}
