return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require('nvim-treesitter').setup()
		require('nvim-treesitter.configs').setup(
			{
				auto_install = true,
				ignore_install = {},
				sync_install = true,
				ensure_installed = { 'php', 'phpdoc' },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false
				},
				folding = {
					enable = true
				},
				indent = {
					enable = true
				}
			}
		)
	end
}

-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	---@diagnostic disable-next-line: unused-local
-- 	opts = function(plugin, opts)
-- 		if opts == nil then
-- 			opts = {}
-- 		end
--
-- 		if opts.ensure_installed == nil then
-- 			opts.ensure_installed = {}
-- 		end
--
-- 		table.insert(opts.ensure_installed, {
-- 			auto_install = true,
-- 			sync_install = true,
-- 			highlight = {
-- 				enable = true,
-- 				additional_vim_regex_highlighting = false
-- 			},
-- 		})
-- 		return opts
-- 	end,
-- }
