return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { import = "abrarshakhi.plugins.completion.nvimcmp" },
      "windwp/nvim-ts-autotag",
    },
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'c',
        'cpp',
        'python',
        'rust',
        'java',
        'vim',
        'lua',
        'bash',
        'html',
        'markdown',
      },
      auto_install = true,
      highlight = {
        enable = true,
      --  additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = {
        enable = true,
        --disable = { 'ruby' }
      },
      autotag = {
        enable = true,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.install').prefer_git = true
      require('nvim-treesitter.configs').setup(opts)
    end,
}
