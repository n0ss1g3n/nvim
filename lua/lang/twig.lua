local lang = {
	treesitter = {
		name = "twig",
	},
	tools = {
		"twig-cs-fixer",
	},
}

return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"ctrl-nvim/mason.nvim",
		},
		---@diagnostic disable-next-line: unused-local
		opts = function(plugin, opts)
			if opts == nil then
				opts = {}
			end

			if opts.ensure_installed == nil then
				opts.ensure_installed = {}
			end

			vim.tbl_map(function(value)
				if value ~= nil then
					table.insert(opts.ensure_installed, value)
				end
			end, lang.tools)
			return opts
		end,
	},
	{
		"nvim-neotest/neotest",
		lazy = true,
		dependencies = {
			"olimorris/neotest-phpunit",
		},
		opts = function()
			return {
				adapters = { require("neotest-phpunit") },
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		---@diagnostic disable-next-line: unused-local
		opts = function(plugin, opts)
			if opts == nil then
				opts = {}
			end

			if opts.ensure_installed == nil then
				opts.ensure_installed = {}
			end

			table.insert(opts.ensure_installed, lang.treesitter.name)
			return opts
		end,
	},
}
