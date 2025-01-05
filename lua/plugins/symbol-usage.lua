return {
	{
		---https://github.com/Wansmer/symbol-usage.nvim
		'Wansmer/symbol-usage.nvim',
		lazy = false,
		event = 'LspAttach', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
		config = function()
			require('symbol-usage').setup({
				vt_position = 'end_of_line',
			})
		end
	}
}
