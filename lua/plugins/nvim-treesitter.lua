return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"java",
				"javascript",
				"typescript",
				"python",
				"lua",
				"json",
				"html",
				"css",
				"xml",
				"yaml",
				"markdown",
				"sql",
				"bash",
				"c",
				"cpp",
				"dockerfile",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
