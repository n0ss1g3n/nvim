return {
	{
		-- https://github.com/b0o/SchemaStore.nvim
		"b0o/schemastore.nvim",
	},
	{
		"ctrl-nvim/mason.nvim",
		config = true,
	},
	{
		-- https://github.com/zapling/mason-lock.nvim
		"zapling/mason-lock.nvim",
		init = function()
			require("mason-lock").setup({
				lockfile_path = vim.fn.stdpath("config") .. "/mason-lock.json" -- (default)
			})
		end
	},
	{
		'kosayoda/nvim-lightbulb',
		opts = {
			autocmd = {
				enabled = false
			},
			sign = {
				enabled = true
			}
		}
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"ctrl-nvim/mason.nvim",
			"b0o/schemastore.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					local lspconfig = require('lspconfig')
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					if server_name == 'phpactor' then
						lspconfig.phpactor.setup({
							init_options = {
								['language_server_completion.trim_leading_dollar'] = true,
								['worse_reflection.stub_dir'] = vim.fn.stdpath("data") .. "/lazy/phpstorm-stubs"
							}
						})
					elseif server_name == "jsonls" then
						capabilities.textDocument.completion.completionItem.snippetSupport = true

						lspconfig.jsonls.setup({
							capabilities = capabilities,
							settings = {
								json = {
									schemas = require('schemastore').json.schemas(),
									validate = { enable = true },
								},
							},
						})
					elseif server_name == "yamlls" then
						lspconfig.yamlls.setup({
							settings = {
								yaml = {
									schemaStore = {
										-- You must disable built-in schemaStore support if you want to use
										-- this plugin and its advanced options like `ignore`.
										enable = false,
										-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
										url = "",
									},
									schemas = require('schemastore').yaml.schemas(),
								},
							},
						})
					else
						lspconfig[server_name].setup({})
					end
				end,
			})
		end,
	},
}
