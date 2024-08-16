-- Auto-completion / Snippets
return {
	-- https://github.com/hrsh7th/nvim-cmp
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		-- Snippet engine & associated nvim-cmp source
		-- https://github.com/L3MON4D3/LuaSnip
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		-- https://github.com/saadparwaiz1/cmp_luasnip
		"saadparwaiz1/cmp_luasnip",

		-- LSP completion capabilities
		-- https://github.com/hrsh7th/cmp-nvim-lsp
		"hrsh7th/cmp-nvim-lsp",

		-- Additional user-friendly snippets
		-- https://github.com/rafamadriz/friendly-snippets
		"rafamadriz/friendly-snippets",
		-- https://github.com/hrsh7th/cmp-buffer
		"hrsh7th/cmp-buffer",
		-- https://github.com/hrsh7th/cmp-path
		"hrsh7th/cmp-path",
		-- https://github.com/hrsh7th/cmp-cmdline
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		-- 图标
		local kind_icons = {
			Text = "",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰇽",
			Variable = "󰂡",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
		}

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll backward
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll forward
				["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						-- 检查是否有选中的条目
						if entry then
							cmp.confirm({ select = false }) -- 直接确认选中的
						else
							fallback() -- 调用 fallback
						end
					else
						fallback()
					end
				end),
				-- Tab through suggestions or when a snippet is active, tab to the next argument
				["<Tab>"] = cmp.mapping(function(fallback)
					-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						if not entry then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						end
						cmp.confirm()
					else
						fallback()
					end
				end, { "i", "s", "c" }),
				-- Tab backwards through suggestions or when a snippet is active, tab to the next argument
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- lsp
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- window = {
			-- 	--  Add borders to completions popups
			-- 	completion = cmp.config.window.bordered(),
			-- 	documentation = cmp.config.window.bordered(),
			-- },
			window = {
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
				}),
			},

			-- 在命令行模式下使用补全
			cmp.setup.cmdline(":", {
				sources = {
					{ name = "cmdline" },
				},
			}),

			-- 在命令行模式下补全文件路径
			cmp.setup.cmdline("/", {
				sources = {
					{ name = "buffer" },
				},
			}),

			formatting = {
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
					-- Source
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[LaTeX]",
					})[entry.source.name]
					return vim_item
				end,
			},
		})
	end,
}
