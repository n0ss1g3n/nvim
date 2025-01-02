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
	defaults = {
		lazy = false,
	},
	checker = { enabled = true, frequency = 60 * 60 * 24 * 7 }, -- automatically check for plugin updates every week
	{ import = "lang" },
	{ import = "plugins" },
	{ import = "core.plugins" },
})