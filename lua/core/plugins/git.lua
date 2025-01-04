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
					mappings = {
						apply = '<nop>',
						reset = '<nop>',
						textobejct = '<nop>',
						goto_first = '<nop>',
						goto_next = '<nop>',
						goto_last = '<nop>'
					}
				},
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
		config = true
	}
}
