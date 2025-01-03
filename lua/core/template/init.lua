vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	---@param ctx table{buf:int, event:string, file: string, id: int, match: string}
	callback = function(ctx)
		local file_content =vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false);
		file_content = table.filter(file_content, function (value)
			return value and value ~= ''
		end)

		if (table.count(file_content) == 0) then
			vim.api.nvim_buf_set_lines(ctx.buf, 0, 3, false, {
				"<?php",
				"",
				"declare(strict_types=1);",
				""
			})
		end
	end,
	pattern = "*.php",
})
