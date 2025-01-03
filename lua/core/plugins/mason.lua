return {
	{
		"ctrl-nvim/mason.nvim",
		config = true,
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
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup_handlers({
				function(server_name)

					if server_name ~= 'phpactor' then
						require("lspconfig")[server_name].setup({})
					else
						require("lspconfig")[server_name].setup({
						 init_options = {
								['worse_reflection.stub_dir'] = vim.fn.stdpath("data") .. "/lazy/phpstorm-stubs"
							}
						})
					end
				end,
			})
		end,
	},
}
