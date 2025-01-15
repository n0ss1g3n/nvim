_G.ctrl = ctrl or {}
ctrl.plugin = ctrl.plugin or {}

---@class PluginDefinition 
---@field [1] string?
---@field name? string display name and name used for plugin config files
---@field main? string Entry module that has setup & deactivate
---@field url string?
---@field dir? string
---@field enabled? boolean|(fun():boolean)
---@field cond? boolean|(fun():boolean)
---@field optional? boolean If set, then this plugin will not be added unless it is added somewhere else
---@field lazy? boolean
---@field priority? number Only useful for lazy=false plugins to force loading certain plugins first. Default priority is 50
---@field dev? boolean If set, then link to the respective folder under your ~/projects
---@field rocks? string[]
---@field virtual? boolean virtual plugins won't be installed or added to the rtp.
---@field dependencies? string[]

---comment
---@param definition PluginDefinition
---@return PluginDefinition
function ctrl.plugin.build_definition(definition)
	return definition
end

