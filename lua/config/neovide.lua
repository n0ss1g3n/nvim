if vim.g.neovide then
	vim.o.guifont = "FiraCode Nerd Font Mono:h9" -- text below applies for VimScript
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_cursor_trail_size = 0.1
	vim.g.neovide_floating_shadow = false
	vim.g.neovide_input_ime = false

	vim.keymap.set({'n'}, '<C-S-v>', 'P')
	vim.keymap.set({'i'}, '<C-S-v>', '<esc>Pi')
	vim.keymap.set({'c'}, '<C-S-v>', '<C-R>"')
end
