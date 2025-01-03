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
		},
		keys = {
			{"<leader>ps", "<cmd>Telescope project hide_workspace=true display_type=full<cr>"}
		},
		opts = {
			extensions = {
				project = {
					on_project_selected = function (prompt_bufnr)
						local project_actions = require("telescope._extensions.project.actions")
						project_actions.change_working_directory(prompt_bufnr, false)
					end
				}
			}
		},
	}
}
