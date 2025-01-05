--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "lang" },
	{ import = "plugins" },
	{ import = "core.plugins" },
	{ 'buffer-types', dev = true, lazy = false, config = true },
}, {

	checker = { enabled = true, frequency = 60 * 60 * 24 * 7 }, -- automatically check for plugin updates every week
	defaults = {
		lazy = false,
	},
	change_detection = {
		enabled = false -- This is just noisy
	},
	dev = {
		path = vim.fn.stdpath('config') .. '/develop',
	},
	performance = {
		cache = {
			enabled = false
		}
	}
})

vim.notify(vim.fn.stdpath('config') .. '/develop')
