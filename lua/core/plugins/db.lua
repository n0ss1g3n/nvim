
--- Connection strings :
--- postgres :
--- - url : postgres://user:secret@127.0.0.1:5432/database?sslmode=disabls
--- - type : postgres
--- mysql :
--- - url : username:password@tcp(localhost:3306)/database_name
--- - type : mysql

return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		-- Install tries to automatically detect the install method.
		-- if it fails, try calling it with one of these parameters:
		--    "curl", "wget", "bitsadmin", "go"
		require("dbee").install()
	end,
	config = function()
		local DbSources = require("dbee.sources")

		require("dbee").setup({

			sources = {
				require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
				require("dbee.sources").FileSource:new(vim.fn.stdpath("state") .. "/dbee/persistence.json"),
				-- DbSources.MemorySource:new({
				-- 	---@type ConnectionParams
				-- 	{
				-- 		id = 'hoplunch',
				-- 		name = 'hoplunch',
				-- 		type = 'mysql',
				-- 		url = 'mysql://hoplunch:test@localhost:3306/hoplunch',
				-- 	},
				-- })
			}

		})
	end,
}
