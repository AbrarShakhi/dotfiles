return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 0.95,
			  width = 1, -- width of the Zen window
			  height = 1, -- height of the Zen window
			  options = {
				  number = true,
				  relativenumber = true, -- disable relative numbers
			  },
		  },
	  },
	  config = function()
		  vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>")
	  end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css",
        "javascript", "typescript",
        "c", "cpp",
        "python",
        "java",
        "rust"
  		},
  	},
  },
}
