vim.keymap.set({'n', 'i', 'v'}, "<F8>",
    "<cmd>w<CR><cmd>!g++ -DAbrarShakhi -s --Wshadow -Wall -Wextra -Wno-unused-result -std=c++17 %:r.cpp -o ./bin.out && ./bin.out < input.txt<CR>",
    { desc = "compile and run cp code." }
)

vim.keymap.set({'n', 'i', 'v'}, "<F9>",
    "<cmd>w<CR><cmd>!g++ -DAbrarShakhi --Wshadow -Wall -Wextra -Wno-unused-result -std=c++17 %:r.cpp -o ./bin.out -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./bin.out < input.txt<CR>",
    { desc = "build and run cp code." }
)


vim.keymap.set({'n', 'i', 'v'}, "<F6>",
    "<cmd>w<CR><cmd>!make -s<CR>",
    { desc = "make.." }
)
