-- 用于格式化语言
return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				java = { "google-java-format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				["*"] = { "codespell" },
        wxml = { "prettier" },
        vue = {"prettier"},
        css = {"prettier"}
			},

			default_format_opts = {
				lsp_format = "fallback",
			},
		})
	end,
}
