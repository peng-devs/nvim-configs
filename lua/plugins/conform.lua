return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			svelte = { "prettier" },
			yaml = { "prettier" },

			-- 其他
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			lsp_format = "fallback",
		},
		notify_on_error = true,
	},
}
