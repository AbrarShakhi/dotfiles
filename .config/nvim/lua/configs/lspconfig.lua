require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "stylua", "prettier", "gopls", "clangd" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
