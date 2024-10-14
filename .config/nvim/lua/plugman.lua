local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  print "Installing packer close and reopen Neovim..."
end

vim.opt.rtp:prepend(lazypath)

local opts =  {
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 '
        }
    }
}

local pluglist = {
    { import = "plugins" },
    { import = "plugins.completion" },
    { import = "plugins.ui" },
    -- { import = "plugins.lsp" },
}

require("lazy").setup(pluglist, opts)

