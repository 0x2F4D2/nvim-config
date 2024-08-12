return {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	opts = {
		-- Enable/disable animations
		animation = true,
		-- Enable/disable current/total tabpages indicator (top right corner)
		tabpages = true,
		-- Enables/disable clickable tabs
		--  - left-click: go to buffer
		--  - middle-click: delete buffer
		clickable = true,
		-- A buffer to this direction will be focused (if it exists) when closing the current buffer.
		-- Valid options are 'left' (the default), 'previous', and 'right'
		focus_on_close = "left",

		icons = {
			-- Configure the base icons on the bufferline.
			-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
			buffer_index = false,
			buffer_number = false, -- 启用 buffer number

			button = "",
			-- Enables / disables diagnostic symbols
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
				[vim.diagnostic.severity.WARN] = { enabled = false },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = true },
			},
			gitsigns = {
				added = { enabled = true, icon = "+" },
				changed = { enabled = true, icon = "~" },
				deleted = { enabled = true, icon = "-" },
			},
			filetype = {
				-- Sets the icon's highlight group.
				-- If false, will use nvim-web-devicons colors
				custom_colors = false,

				-- Requires `nvim-web-devicons` if `true`
				enabled = true,
			},
			separator = { left = "▎", right = "" },

			-- If true, add an additional separator at the end of the buffer list
			separator_at_end = true,

			-- Configure the icons on the bufferline when modified or pinned.
			-- Supports all the base icon options.
			modified = { button = "●" },
			pinned = { button = "", filename = true },

			-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
			preset = "default",

			-- Configure the icons on the bufferline based on the visibility of a buffer.
			-- Supports all the base icon options, plus `modified` and `pinned`.
			alternate = { filetype = { enabled = false } },
			current = { buffer_index = false },
			inactive = { button = "×" },
			visible = { modified = { buffer_number = false } },
		},
		-- Set the filetypes which barbar will offset itself for
		sidebar_filetypes = {
			-- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
			NvimTree = true,
			-- Or, specify the text used for the offset:
			undotree = {
				text = "undotree",
				align = "center", -- *optionally* specify an alignment (either 'left', 'center', or 'right')
			},
			-- Or, specify the event which the sidebar executes when leaving:
			["neo-tree"] = { event = "BufWipeout" },
			-- Or, specify all three
			Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
		},
		-- New buffer letters are assigned in this order. This order is
		-- optimal for the qwerty keyboard layout but might need adjustment
		-- for other layouts.
		letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

		-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
		-- where X is the buffer number. But only a static string is accepted here.
		no_name_title = "[Empty Tabs]",

		-- sorting options
		sort = {
			-- tells barbar to ignore case differences while sorting buffers
			ignore_case = true,
		},
	},

	version = "^1.9.1",
	config = function(_, opts)
		require("barbar").setup(opts)
	end,
}
