return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"dockerfile",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"html",
				"json",
				"javascript",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"perl",
				"php",
				"proto",
				"python",
				"terraform",
				"toml",
				"typescript",
				"tsx",
				"yaml",
				"vim",
				"vimdoc",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}