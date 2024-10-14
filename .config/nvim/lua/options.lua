vim.g.mapleader = " "					-- sets leader key
vim.g.netrw_banner = 0					-- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split=4				-- open in prior window
vim.g.netrw_altv = 1					-- change from left splitting to right splitting
vim.g.netrw_liststyle=3					-- tree style view in netrw
--vim.cmd("let g:netrw_list_hide=netrw_gitignore#Hide()")
vim.opt.title = true					-- show title
vim.cmd('set path+=**')					-- search current directory recursively
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false				-- turn off vi compatibility mode
vim.opt.number = true					-- turn on line numbers
vim.opt.relativenumber = true				-- turn on relative line numbers
vim.opt.mouse = 'a'						-- enable the mouse in all modes
vim.opt.ignorecase = true				-- enable case insensitive searching
vim.opt.smartcase = true				-- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = false				-- disable all highlighted search results
vim.opt.incsearch = true				-- enable incremental searching
vim.opt.wrap = true						-- enable text wrapping
vim.opt.tabstop = 4						-- tabs=4spaces
vim.opt.shiftwidth = 4
vim.opt.fileencoding = "utf-8"				-- encoding set to utf-8
vim.opt.pumheight = 10					-- number of items in popup menu
vim.opt.showtabline = 2					-- always show the tab line
vim.opt.laststatus = 2					-- always show statusline
vim.opt.signcolumn = "auto"
vim.opt.expandtab = false				-- expand tab 
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 2 -- 0
vim.opt.showmode = true
vim.opt.scrolloff = 8					-- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8				-- scroll page when cursor is 8 spaces from left/right
vim.opt.guifont = "monospace:h17"		
vim.opt.clipboard = unnamedplus
vim.opt.completeopt= { "menuone", "noselect" }
vim.opt.splitbelow = true				-- split go below
vim.opt.splitright = true				-- vertical split to the right
vim.opt.termguicolors = true			-- terminal gui colors      

local options = {
    swapfile = false,                        -- creates a swapfile
    undofile = true,                         -- enable persistent undo
    conceallevel = 0,                        -- so that `` is visible in markdown files
    timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    -- expandtab = true,                        -- convert tabs to spaces
    
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,                             -- insert 2 spaces for a tab
    softtabstop = 4,
    
    -- cursorline = true,                       -- highlight the current line
    
    numberwidth = 4,                         -- set number column width to 2 {default 4}
    --signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = false,                            -- display lines as one long line
    
    -- ruler = true,
    
    list = true,                             -- sets how neovim will display certain whitespace characters in the editor.
    listchars = { tab = '» ', trail = '·', nbsp = '␣' },
    
    inccommand = 'split'                     -- preview substitutions live, as you type!
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.have_nerd_font = false

-- vim.g.loaded_netrw       = 1
-- vim.g.loaded_netrwPlugin = 1

vim.opt.shortmess:append "c"
vim.opt.isfname:append("@-@")

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to workA

vim.cmd('colorscheme catppuccin')			-- set colorscheme
vim.cmd('filetype plugin on')			-- set filetype 
vim.cmd('set wildmenu')					-- enable wildmenu



































--statusline
vim.cmd "highlight StatusType guibg=#F2CDCD guifg=#1d2021"
vim.cmd "highlight StatusFile guibg=#1d2021 guifg=#A6E3A1"
vim.cmd "highlight StatusModified guibg=#1d2021 guifg=#F38BA8"
vim.cmd "highlight StatusBuffer guibg=#CBA6F7 guifg=#1d2021"
vim.cmd "highlight StatusLocation guibg=#89B4FA guifg=#1d2021"
vim.cmd "highlight StatusPercent guibg=#1d2021 guifg=#F5C2E7"
vim.cmd "highlight StatusNorm guibg=none guifg=white"
vim.o.statusline = " "..
""..
" "..
"%l"..
" "..
                " %#StatusType#"..
                "<< " ..
                "%Y"  ..
                "  " ..
                " >>" ..
                "%#StatusFile#" ..
                "<< " ..
                "%F" ..
                " >>" ..
                "%#StatusModified#" ..
                " " ..
                "%m" ..
                " " ..
                "%#StatusNorm#" ..
                "%=" ..
                "%#StatusBuffer#" ..
                "<< " ..
                "﬘ " ..
                "%n" ..
                " >>" ..
                "%#StatusLocation#" ..
                "<< " ..
                "燐 " ..
                "%l,%c" ..
                " >>" ..
                "%#StatusPercent#" ..
                "<< " ..
                "%p%%  " ..
                " >> "
                

        
