local opt  = vim.opt

opt.shiftwidth = 2
opt.tabstop = 2

opt.wrap = false

opt.number = true

opt.laststatus = 3

opt.clipboard = 'unnamedplus'

opt.autowrite = true
opt.autowriteall = true

opt.splitright = true
opt.splitbelow = true

vim.opt.fillchars:append('diff: ')

vim.g.foldmethod = 'expr'
vim.g.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
