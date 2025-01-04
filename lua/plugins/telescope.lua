return {
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		},
		dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-telescope/telescope-fzy-native.nvim" },
		config = true
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-telescope/telescope-project.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"nvim-telescope/telescope-fzy-native.nvim"
		},
		keys = {
			{ "<leader>ps", "<cmd>Telescope project hide_workspace=true display_type=full<cr>" }
		},
		config = function()
			require('telescope').setup({
				{
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown {
							}
						},
						project = {
							on_project_selected = function(prompt_bufnr, name)
								local project_actions = require("telescope._extensions.project.actions")
								project_actions.change_working_directory(prompt_bufnr, false)

								vim.cmd('TabRename ' .. name)
							end
						}
					}
				},
			})
		end

	}
}
