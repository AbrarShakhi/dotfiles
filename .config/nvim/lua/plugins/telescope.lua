return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep',
        { 'nvim-telescope/telescope-ui-select.nvim' },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end
        },
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        })

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require('telescope.builtin')
        local nvx_modes = {'n','v','x'}

        vim.keymap.set(nvx_modes, '<leader>ff', builtin.current_buffer_fuzzy_find, { desc = '[F]uzzily search in [C]urrent buffer' })
        vim.keymap.set(nvx_modes, '<leader>ss', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set(nvx_modes, '<leader>.', builtin.live_grep, { desc = '[S]earch by [G]rep' })

        vim.keymap.set(nvx_modes, '<leader><leader>', builtin.find_files, { desc = 'find files' })
        vim.keymap.set(nvx_modes, '<leader><CR>', builtin.buffers, { desc = 'find files in buffers' })

        vim.keymap.set(nvx_modes, '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

        vim.keymap.set(nvx_modes, '<leader>;', builtin.builtin, { desc = 'search Telescope command' })
        vim.keymap.set(nvx_modes, "<leader>'", builtin.oldfiles, { desc = 'search Recent Files' })
        vim.keymap.set(nvx_modes, '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set(nvx_modes, '<leader>km', builtin.keymaps, { desc = 'search [K]ey[M]aps' })
        vim.keymap.set(nvx_modes, '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

        vim.keymap.set(nvx_modes, '<leader>sc', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })
    end
}




          























