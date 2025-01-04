return {
    "nanozuki/tabby.nvim",
		  dependencies = 'nvim-tree/nvim-web-devicons',

    config = function()
      vim.o.showtabline = 2
      vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
			require('tabby').setup({})
		end
}
