-- File Explorer / Tree
return {
  -- https://github.com/nvim-tree/nvim-tree.lua
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    "nvim-tree/nvim-web-devicons", -- Fancy icon support
  },
  opts = {
    -- git
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    renderer = {
      highlight_opened_files = "all", -- 高亮打开的文件
      indent_markers = {
        enable = true, -- 启用缩进标记
      },
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
    filters = {
      custom = { '.DS_Store' }
    }
  },

	config = function(_, opts)
	-- Recommended settings to disable default netrw file explorer
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- 配置按键
	local function my_on_attach(bufnr)
		local api = require("nvim-tree.api")
		local map = vim.keymap.set

		local function tips(desc)
			return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		api.config.mappings.default_on_attach(bufnr)
		-- custom mappings
		map("n", "?", api.tree.toggle_help, tips("Help"))
		map("n", "v", api.node.open.vertical, tips("Open: Vertical Split"))
		map("n", "h", api.node.open.horizontal, tips("Open: Vertical Split"))
		--map("n", "<LeftRelease>", api.node.open.edit, tips("打开Tree")) -- 打开tree
	end

	opts.on_attach = my_on_attach

	require("nvim-tree").setup(opts)
	end,
}
