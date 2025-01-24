return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			-- require("mini.animate").setup()
			-- require('mini.base16').setup()
			require("mini.basics").setup()
			require("mini.comment").setup()
			-- require('mini.files').setup()
			-- require('mini.git').setup()
			require("mini.statusline").setup({
				use_icons = vim.g.have_nerd_font,
			})
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			terminal = {
				enable = true,
			},
			win = {
				enable = false,
			},
			-- gitbrowse = {},
			-- lazygit = {},
		},
		keys = {
			{
				"<leader>tt",
				function()
					Snacks.terminal()
				end,
				desc = "Toggle Terminal",
			},
		},
	},
}
