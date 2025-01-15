return {
	{
		'nvim-telescope/telescope.nvim',
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"nvim-telescope/telescope-fzy-native.nvim"
		},
		config = function()
			require('telescope').setup({
				defaults = {
					prompt_prefix = "   ",
					selection_caret = " ",
					entry_prefix = " ",
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
						},
						width = 0.87,
						height = 0.80,
					},
					mappings = {
						n = { 
							["q"] = require("telescope.actions").close ,
							-- ["p"] = ,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					},
					project = {
						on_project_selected = function(prompt_bufnr, name)
							local project_actions = require("telescope._extensions.project.actions")
							project_actions.change_working_directory(prompt_bufnr, false)
							if name == nil then
								name = 'editor'
							end
							vim.cmd('TabRename ' .. name)
						end
					}
				}
			})
		end

	},
	--https://github.com/nvim-telescope/telescope-project.nvim 
	'nvim-telescope/telescope-project.nvim',
	'nvim-telescope/telescope-ui-select.nvim',
	{
		--- https://github.com/LukasPietzschmann/telescope-tabs
		'LukasPietzschmann/telescope-tabs',
		lazy = false,
		config = function()
			require('telescope').load_extension 'telescope-tabs'
			require('telescope-tabs').setup {
				entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
					local tab_name_api = require('tabby.feature.tab_name')
					local tab_name = tab_name_api.get(tab_id)
					return tab_name
				end,

				-- Your custom config :^)
			}
		end,
		dependencies = { 'nvim-telescope/telescope.nvim' },
	}

}
