return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			{ import = "plugins.lsp.mason" },
		},
		config = function()
			local null_ls = require("null-ls")

			local null_format = null_ls.builtins.formatting
			local null_diag = null_ls.builtins.diagnostics

			null_ls.setup({
				sources = {
					null_format.stylua,

					null_format.prettier,

					null_format.clang_format,
				},
			})
			vim.keymap.set("n", "<leader>fmt", function()
				vim.lsp.buf.format()
			end, {})
		end,
	},
}

-- if true then return {} end

-- return {
--     'stevearc/conform.nvim',
--     lazy = false,
--     keys = {
--         {
--             '<leader>fmt',
--             function()
--                 require('conform').format { async = true, lsp_fallback = true }
--             end,
--             mode = '',
--             desc = '[F]or[M]a[t] buffer',
--         },
--     },
--     opts = {
--         notify_on_error = false,
--         format_on_save = function(bufnr)
--             local disable_filetypes = {
--                 -- c = true,
--                 -- cpp = true
--             }
--             return {
--                 timeout_ms = 500,
--                 lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
--             }
--         end,
--         formatters_by_ft = {
--             lua = { 'stylua' },
--             -- python = { "isort", "black" },
--             -- javascript = { { "prettierd", "prettier" } },
--         },
--     },
-- }
