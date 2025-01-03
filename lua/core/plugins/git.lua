return
	{
 		{
    "echasnovski/mini.diff",
    config = function()
			require("mini.diff").setup({
        view = {
					style = "sign",
					signs = { add = '┃', change = '┃', delete = '┃'}
				},
      })
    end,
  },
}
