return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		-- Check if we should disable formatting or not
		-- If git config contains format.disable = true, then disable formatting
		local function has_git_config_disable_format()
			local result = vim.fn.system("git config --get format.disable")
			return vim.v.shell_error == 0 and vim.trim(result) == "true"
		end

		local format_on_save_enabled = true
		if has_git_config_disable_format() then
			format_on_save_enabled = false
		end

		conform.setup({
			formatters_by_ft = {
				bash = { "shfmt" },
				css = { "prettier" },
				go = { "goimports", "gofumpt" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "markdown-toc", "markdownlint-cli2" },
				php = { "php-cs-fixer" },
				python = { "ruff" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				yaml = { "prettier" },
			},
			format_on_save = format_on_save_enabled and {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			} or nil,
		})

		vim.keymap.set({ "n", "v" }, "<leader>o", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
