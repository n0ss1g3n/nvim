return {
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		lazy = true,
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				{ path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"},
			},
			workspace = {
				checkThirdParty = true
			}
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"saghen/blink.cmp",
		dependencies = { "folke/lazydev.nvim" },
		-- optional: provides snippets for the snippet source
		-- dependencies = "rafamadriz/friendly-snippets",

		-- use a release tag to download pre-built binaries
		version = "*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			signature = { enabled = true },
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = {
				preset = "none",
				["<C-space>"] = { "show", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<cr>"] = { "accept", "fallback" },
				cmdline = {
					preset = "none",
					["<C-y>"] = { "accept", "fallback" },
					["<C-space>"] = { "show", "fallback" },
					["<C-p>"] = { "select_prev", "fallback" },
					["<C-n>"] = { "select_next", "fallback" },
				},
			},

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = false,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},
			completion = {
				menu = {
					border = "single",
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					window = {
						border = "none",
					},
				},
				ghost_text = { enabled = true },
				list = {
					cycle = {
						from_top = true,
						from_bottom = true,
					},
				},
			},
			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere ,in your config, without redefining it, due to `opts_extend`
			sources = {
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},

				default = {
					"lazydev",
					"lsp",
					"path",
					-- "snippets",
					-- "buffer",
				},
			},
		},
		-- opts_extend = { "sources.default" },
	},
}
