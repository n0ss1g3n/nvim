vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = (desc .. " [LSP]") })
end

map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
-- Jump to the definition of the word under your cursor.
--  This is where a variable was first declared, or where a function is defined, etc.
--  To jump back, press <C-t>.
-- map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

-- Find references for the word under your cursor.
-- map("<leader>fr", require("telescope.builtin").lsp_references, "[F]ind [R]eferences")

-- Jump to the implementation of the word under your cursor.
--  Useful when your language has ways of declaring types without an actual implementation.
-- map("<leader>fi", require("telescope.builtin").lsp_implementations, "[F]ind [I]mplementation")

-- Jump to the type of the word under your cursor.
--  Useful when you're not sure what type a variable is and you want to see
--  the definition of its *type*, not where it was *defined*.
-- map("<leader>cd", require("telescope.builtin").lsp_type_definitions, "[Code] [D]efinition")

-- Fuzzy find all the symbols in your current document.
--  Symbols are things like variables, functions, types, etc.
-- map("<leader>fs", require("telescope.builtin").lsp_document_symbols, "[F]ind [S]ymbols")

-- Fuzzy find all the symbols in your current workspace.
--  Similar to document symbols, except searches over your entire project.
-- map("<leader>fS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[F]ind Workspace [S]ymbols")

-- Rename the variable under your cursor.
--  Most Language Servers support renaming across files, etc.
map("<leader>cr", vim.lsp.buf.rename, "[Code] [R]ename")

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

-- Opens a popup that displays documentation about the word under your cursor
--  See `:help K` for why this keymap.
map("K", vim.lsp.buf.hover, "Hover Documentation")

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header.
map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")