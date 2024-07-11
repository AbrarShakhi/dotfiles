
vim.keymap.set({'n', 'i', 'v'}, "<F9>",
    "<cmd>w<CR><cmd>!g++ -static -DAbrarShakhi -lm -s -x c++ -Wall -Wextra -O2 -std=c++17 -o bin %:r.cpp && ./bin < input.txt <CR>",
    { desc = "run code.." }
)

vim.keymap.set({'n', 'i', 'v'}, "<F6>",
    "<cmd>w<CR><cmd>!make<CR>",
    { desc = "make.." }
)
