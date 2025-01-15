return {
	{
		--
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				flavour = 'mocha',
				no_italic = true,
				term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
				styles = {
					comments = {},
					conditionals = {}
				},
				integrations = {
					treesitter = true,
					snacks = true,
					fidget = true,
					mason = true,
					neogit = true,
					neotest = true,
					dap = true,
					dap_ui = true,
					overseer = true,
					vimwiki = true,
					which_key = true,

					telescope = {
						enabled = true,
						style = "nvchad"
					}
				}
			})
			vim.cmd("colorscheme catppuccin-mocha")
		end,
		priority = 1000
	},
}
