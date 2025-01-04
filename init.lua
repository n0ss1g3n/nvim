require('core.std.string')
require('core.std.table')
require('core.diagnostics')
require('core.template')
require("config.keymap")
require("config.option")
require("core.lazy")

--- TODO: Implement in lazy config
require("telescope").load_extension("ui-select")


if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font Mono:h12" -- text below applies for VimScript
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_cursor_trail_size = 0.1
end
