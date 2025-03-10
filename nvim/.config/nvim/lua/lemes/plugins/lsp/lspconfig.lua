return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		local config = {
			virtual_text = false,
		}

		vim.diagnostic.config(config)

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set(
				"n",
				"gR",
				"<cmd>Telescope lsp_references<CR>",
				{ desc = "Show definition, references", noremap = true, silent = true }
			) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set(
				"n",
				"gD",
				vim.lsp.buf.declaration,
				{ desc = "Go to declaration", noremap = true, silent = true }
			) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set(
				"n",
				"gd",
				"<cmd>Telescope lsp_definitions<CR>",
				{ desc = "Show lsp definitions", noremap = true, silent = true }
			) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set(
				"n",
				"gi",
				"<cmd>Telescope lsp_implementations<CR>",
				{ desc = "Show lsp implementations", noremap = true, silent = true }
			) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set(
				"n",
				"gt",
				"<cmd>Telescope lsp_type_definitions<CR>",
				{ desc = "Show lsp type definitions", noremap = true, silent = true }
			) -- show lsp type definitions

			keymap.set(
				"n",
				"gl",
				"<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>",
				{ desc = "Show lsp error message", noremap = true, silent = true }
			) -- show lsp error message

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
				desc = "See available code actions, in visual mode will apply to selection",
				noremap = true,
				silent = true,
			}) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename", noremap = true, silent = true }) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set(
				"n",
				"<leader>D",
				"<cmd>Telescope diagnostics bufnr=0<CR>",
				{ desc = "Show diagnostics for file", noremap = true, silent = true }
			) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set(
				"n",
				"<leader>d",
				vim.diagnostic.open_float,
				{ desc = "Show diagnostics for line", noremap = true, silent = true }
			) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set(
				"n",
				"[d",
				vim.diagnostic.goto_prev,
				{ desc = "Jump to previous diagnostic in buffer", noremap = true, silent = true }
			) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set(
				"n",
				"]d",
				vim.diagnostic.goto_next,
				{ desc = "Jump to next diagnostic in buffer", noremap = true, silent = true }
			) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set(
				"n",
				"sd",
				vim.lsp.buf.hover,
				{ desc = "show documentation for what is under cursor", noremap = true, silent = true }
			) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set(
				"n",
				"<leader>rs",
				":LspRestart<CR>",
				{ desc = "Mapping to restart lsp if necessary", noremap = true, silent = true }
			) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure html server
		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure pythons server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		local util = require("lspconfig/util")
		-- configure go server
		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
