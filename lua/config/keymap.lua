vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = (desc .. " [LSP]") })
end

map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
-- Jump to the definition of the word under your cursor.
--  This is where a variable was first declared, or where a function is defined, etc.
--  To jump back, press <C-t>.
vim.keymap.set('n', "gd", function()
	require("telescope.builtin").lsp_definitions()
end, { desc = "[G]oto [D]efinition" })

-- Find references for the word under your cursor.
vim.keymap.set('n', "gr", function()
	require("telescope.builtin").lsp_references()
end, { desc = "[F]ind [R]eferences" })

-- Jump to the implementation of the word under your cursor.
--  Useful when your language has ways of declaring types without an actual implementation.
vim.keymap.set('n', "gi", function()
	require("telescope.builtin").lsp_implementations()
end, { desc = "[F]ind [I]mplementation" })

-- Jump to the type of the word under your cursor.
--  Useful when you're not sure what type a variable is and you want to see
--  the definition of its *type*, not where it was *defined*.
-- vim.keymap.set('n', "<leader>cd", require("telescope.builtin").lsp_type_definitions, { desc = "[Code] [D]efinition" })

-- Fuzzy find all the symbols in your current document.
--  Symbols are things like variables, functions, types, etc.
vim.keymap.set('n', "<leader>fs", function()
	require("telescope.builtin").lsp_document_symbols()
end, { desc = "[F]ind [S]ymbols" })

vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>")
vim.keymap.set('n', '<leader>fw', "<cmd>Telescope live_grep<cr>")

vim.keymap.set('n', "<leader>ps", "<cmd>Telescope project hide_workspace=true display_type=full<cr>")
-- Fuzzy find all the symbols in your current workspace.
--  Similar to document symbols, except searches over your entire project.
vim.keymap.set('n', "<leader>fS", function()
		require("telescope.builtin").lsp_dynamic_workspace_symbols()
	end,
	{ desc = "[F]ind Workspace [S]ymbols" })

vim.keymap.set('n', "<leader>fb", '<cmd>Telescope buffers<cr>')



-- Rename the variable under your cursor.
--  Most Language Servers support renaming across files, etc.
vim.keymap.set('n', "<leader>cr", vim.lsp.buf.rename, { desc = "[Code] [R]ename" })

vim.keymap.set('n', "<leader>cf", vim.lsp.buf.format, { desc = "[Code] [F]ormat" })

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

-- Opens a popup that displays documentation about the word under your cursor
--  See `:help K` for why this keymap.
vim.keymap.set('n', "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header.
vim.keymap.set('n', "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

vim.keymap.set({ 'n', 'o', 'v' }, 'gh', '0')
vim.keymap.set({ 'n', 'o', 'v' }, 'gl', '$')
vim.keymap.set({ 'n', 'o', 'v' }, 'ge', 'G$')
vim.keymap.set({ 'n', 'o', 'v' }, 'gs', '^')

vim.keymap.set('n', '<leader>th', '<cmd>tabprev<cr>')
vim.keymap.set('n', '<leader>tl', '<cmd>tabnext<cr>')
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<leader>td', '<cmd>tabclose<cr>')
vim.keymap.set('n', '<leader>ts', '<cmd>Telescope telescope-tabs list_tabs<CR>')
vim.keymap.set('n', '<leader>tr', function()
	vim.ui.input({
		prompt = "Tab name",
		default = require('tabby.feature.tab_name').get(0),
	}, function(value)
		vim.cmd("TabRename " .. value)
	end)
end)

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')
vim.keymap.set('n', 'J', vim.diagnostic.open_float, {})

vim.api.nvim_create_user_command('Notifications', function()
	local history = require('snacks').notifier.get_history({})
	local bufnr = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(bufnr, 'number', false)
	vim.api.nvim_buf_set_option(bufnr, 'relativenumber', false)
	vim.opt_local.number = false
	vim.opt_local.relativenumber = false

	local winId = vim.api.nvim_open_win(bufnr, true, {
		relative = 'win',
		width = 120,
		height = 10,
		border = "single",
		row = 20,
		col = 20,
		zindex = 100,
	})

	local content = {}
	for _, value in ipairs(history) do
		local message = string.replace('\n', '|', value.msg)
		table.insert(content, '[' .. value.level .. '] ' .. message)
	end

	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, content)
	vim.keymap.set('n', 'q', function()
			vim.api.nvim_buf_delete(bufnr, { force = true })
		end,
		{ buffer = bufnr }
	)
end, {})
