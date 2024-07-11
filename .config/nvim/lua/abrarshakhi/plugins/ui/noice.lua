return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        -- "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            messages = {
                enabled = false,
            },
            views = {
                cmdline_popup = {
                    border = {
                        -- style = "none",
                        -- padding = { 1, 1 },
                    },
                    filter_options = {},
                    win_options = {
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    },
                },
            },
        })
    end,
}
