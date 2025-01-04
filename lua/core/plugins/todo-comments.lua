--- @module 'todo-comments.config'

return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		--- @type TodoOptions
		--- @diagnostic disable-next-line: missing-fields
		opts = {
			keywords = {
				--- TODO: Ceci est un todo
				TODO = { icon = "󰄳 ", color = "info" },
				--- HACK: Ceci est un hack
				HACK = { icon = "󱠇 ", color = "warning" },
				--- WARN: Ceci est un warn
				WARN = { icon = "󰀨 ", color = "warning", alt = { "WARNING", "XXX" } },
				--- PERF: Ceci est une perf
				PERF = { icon = "󱠇 ", color = 'error', alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				--- NOTE: Ceci est une note
				--- note: ceci est une note
				--- Ceci est du texte
				NOTE = { icon = "󰛿 ", color = "hint", alt = { "INFO", "note" } },
				--- TEST: Ceci est un test
				TEST = { icon = "󰰥 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			}
		},
	}
}
