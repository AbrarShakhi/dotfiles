return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		-- " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
		config = function()
			-- vim.cmd.colorscheme "catppuccin"
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
