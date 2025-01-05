_G.ctrl = ctrl or {}
ctrl.event = ctrl.event or {}

--- @class ctrl.event.eventData
--- @field id integer
--- @field event string
--- @field group integer|nil
--- @field file string
--- @field match string
--- @field buf integer
--- @field data any

---comment
---@param name any
---@param callback fun(eventData: ctrl.event.eventData)
function ctrl.event.on(name, callback)
	vim.api.nvim_create_autocmd("User", {
		pattern = name,
		callback = callback,
	})
end

function ctrl.event.define(name)
	--- TODO Definir un state
end

function ctrl.event.trigger(name, data)
	--- TODO: Vérifier que l'event est défini avant son trigger
	vim.api.nvim_exec_autocmds("User", { pattern = name })
end

