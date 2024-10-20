return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				keymap.set("n", "lr", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
				keymap.set("n", "lD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
				keymap.set("n", "ld", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
				keymap.set("n", "li", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
				keymap.set("n", "lt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
				keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					{ desc = "Show buffer diagnostics" }
				)
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
				keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
				keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
				keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
				keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "Restart LSP" })
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = false, -- Do not show diagnostics as inline virtual text
			signs = true, -- Show signs in the gutter
			update_in_insert = false, -- Do not show diagnostics in insert mode
			underline = true, -- Keep the underlining for diagnostics
			severity_sort = true, -- Sort diagnostics by severity
			float = { -- Configure the floating window that shows on hover
				source = "always", -- Show the source of the diagnostic in the floating window
			},
		})

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
