if true then return {} end

return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"clangd",
			"clang-format",
			"codelldb",
		}
	}
}