require('core')
require('config')
require("core.lazy")

--- TODO: Implement in lazy config
require("telescope").load_extension("ui-select")


ctrl.event.on_tcd(function ()
	vim.notify("Dir changed")
end)
