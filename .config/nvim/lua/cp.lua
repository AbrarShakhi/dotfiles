vim.keymap.set({'n', 'i', 'v'}, "<F8>",
    "<cmd>w<CR><cmd>!cprun.sh %:r -rio<CR>",
    { desc = "compile and run cp code." }
)

vim.keymap.set({'n', 'i', 'v'}, "<F9>",
    "<cmd>w<CR><cmd>!cprun.sh %:r -rdio<CR>",
    { desc = "build and run cp code." }
)


vim.keymap.set({'n', 'i', 'v'}, "<F6>",
    "<cmd>w<CR><cmd>!make -s<CR>",
    { desc = "make.." }
)
