return {
	-- LSP Configuration
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		-- LSP Management
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer" },
	},

	-- 语言参考： https://mason-registry.dev/registry/list
	-- 安装语言服务器
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"volar", -- Vue
				"jdtls", -- Java
				"dockerls", -- Docker
				"pyright", -- Python
				"tsserver",
			},
		})
		-- 安装debug和formatter相关
		require("mason-tool-installer").setup({
			ensure_installed = {
				"js-debug-adapter",
				"java-debug-adapter",
				"java-test",
				"stylua",
				"black",
				"google-java-format",
				"prettier",
				"codespell",
				"eslint",
			},
		})

		vim.api.nvim_command("MasonToolsInstall")

		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lsp_attach = function() end

		-- Call setup on each LSP server
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				if server_name ~= "jdtls" then
					lspconfig[server_name].setup({
						on_attach = lsp_attach,
						capabilities = lsp_capabilities,
					})
				end
			end,
		})
		-- Lua LSP settings
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		local mason_registry = require("mason-registry")
		local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
			.. "/node_modules/@vue/language-server"

    -- TypeScript LSP Setting
		lspconfig.tsserver.setup({
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = vue_language_server_path,
						languages = { "vue" },
					},
				},
			},
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		})

		-- No need to set `hybridMode` to `true` as it's the default value
		lspconfig.volar.setup({})

	end,
}
