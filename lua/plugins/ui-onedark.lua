return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	config = function(_)
		vim.cmd("colorscheme onedark")

    -- setting float window color
		vim.cmd("hi NormalFloat guibg=NONE")
		vim.cmd("hi FloatBorder guibg=NONE guifg=BorderBG")
	end,
}
