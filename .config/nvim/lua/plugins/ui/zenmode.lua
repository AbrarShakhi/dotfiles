return {
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
        vim.keymap.set('n', '<leader>zz', "<cmd>ZenMode<CR>")
    end,
}
