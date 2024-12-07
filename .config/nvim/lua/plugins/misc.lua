return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.ai').setup()
            require('mini.animate').setup()
            -- require('mini.base16').setup()
            require('mini.basics').setup()
            require('mini.comment').setup()
            require('mini.files').setup()
            require('mini.statusline').setup({
                use_icons = true
            })
        end
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            terminal = {
                enable = true
            },
            win = {
                enable = false
            }
        },
        keys = {
            { "<leader>tt", function() Snacks.terminal() end, desc = "Toggle Terminal" },
        }
    }
}
