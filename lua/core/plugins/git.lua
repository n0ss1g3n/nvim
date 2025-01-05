return
{
	{
		--- :help MiniDiff.config
		"echasnovski/mini.diff",
		config = function()
			--- @module "mini.diff"
			require("mini.diff").setup({
				view = {
					style = "sign",
					signs = { add = '┃', change = '┃', delete = '┃' },
				},
				mappings = {
					apply = '',
					reset = '',
					textobejct = '',
					goto_first = '',
					goto_next = '',
					goto_last = ''
				}
			})
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = function()
			require('neogit').setup({
				graph_style = "unicode"
			})
		end
	}
}
