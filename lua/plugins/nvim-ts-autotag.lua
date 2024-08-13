return {
	"windwp/nvim-ts-autotag",
	opts = {
		opts = { enable_close = true, enable_rename = true, enable_close_on_slash = false },
	},
	config = function(_, opts)
		require("nvim-ts-autotag").setup(opts)
	end,
}
