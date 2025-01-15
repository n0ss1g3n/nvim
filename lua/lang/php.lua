local lang = {
	treesitter = {
		name = "php",
	},
	tools = {
		"phpactor",
		"phpstan",
		"php-cs-fixer",
		"php-debug-adapter",
		"marksman"
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
	--- Will never load, just used to get phpstorm-stubs for phpactor lsp
	{ "JetBrains/phpstorm-stubs", lazy = true },
	{
		"nvim-neotest/neotest",
		lazy = false,
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"olimorris/neotest-phpunit",
		},
		config = function()
			require('neotest').setup {
				adapters = {
					require("neotest-phpunit")({
						phpunit_cmd = function()
							return "docker compose exec app php vendor/bin/phpunit"
						end
					})

				},
			}
		end,
	},
	-- {
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
	-- 		table.insert(opts.ensure_installed, lang.treesitter.name)
	-- 		return opts
	-- 	end,
	-- },
}
