local lang = {
	treesitter = {
		name = "php",
	},
	tools = {
		"phpactor",
		"phpstan",
		"php-cs-fixer",
		"php-debug-adapter",
	},
}

return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"ctrl-nvim/mason.nvim",
		},
		--- 
		---@param plugin LazyPlugin
		---@param opts any
		---@return any
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
	--- Will never load, just used to get phpstorm-stubs for phpactor lsp
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
