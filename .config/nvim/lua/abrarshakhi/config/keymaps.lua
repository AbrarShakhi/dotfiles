local opts = { noremap = true, silent = true }
local topts = { silent = true }
local map = vim.keymap.set

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


map({'n', 'v', 'x'}, '<Up>', 'k', opts)
map({'n', 'v', 'x'}, '<Down>', 'j', opts)
map({'n', 'v', 'x'}, '<Right>', 'l', opts)
map({'n', 'v', 'x'}, '<Left>', 'h', opts)

-- terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

map("n", "<C-z>", "u", { desc = "undo" })
map("i", "<C-z>", "<C-o>u", { desc = "undo" })
map("n", "<C-y>", "<C-r>", { desc = "redo" })
map("i", "<C-y>", "<C-o><C-r>", { desc = "redo" })

map("i", "<C-c>", "<Esc>")
map("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left>]])

map({"n", "v", "i", "x"}, "<C-a>", "<Esc>ggVG<CR>", {desc = "ctrl-a to select all"})
map({"n", "v", "i", "x"}, "<C-s>", "<cmd>w<CR>", {desc = "ctrl-s to save"})



map("n", "<C-n>", "<cmd>enew<CR>", { desc = "buffer new" })

-- Better navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window right" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window down" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window up" })

map("t", "<C-h>", "<C-\\><C-N><C-w>h", topts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", topts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", topts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", topts)

map('n', '<leader><Esc>', '<cmd>nohlsearch<CR>')

-- Navigate buffers
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<", "v<<Esc>", opts)
map("n", ">", "v><Esc>", opts)


-- Move text up and down
local nd = "<cmd>m .+1<CR>"
local nu = "<cmd>m .-2<CR>"
local xd = "<cmd>move '>+1<CR>gv-gv"
local xu = "<cmd>move '<-2<CR>gv-gv"
map("n", "<A-j>", nd, opts)
map({"n", "i"}, "<A-Down>", nd, opts)
map("n", "<A-k>", nu, opts)
map({"n", "i"}, "<A-Up>", nu, opts)
map("x", "<A-j>", xd, opts)
map("x", "<A-Down>", xd, opts)
map("x", "<A-k>", xu, opts)
map("x", "<A-Up>", xu, opts)

-- Alt + J/K to copy line up/down
map("n", "<A-J>", "yyp", opts)
map("n", "<A-K>", "yyP", opts)
map("i", "<A-J>", "<C-o>yy<C-o>p", opts)
map("i", "<A-K>", "<C-o>yy<C-o>P", opts)
-- map({'x', 'v'}, '<A-J>', "<cmd>'<,'>y<CR>p", opts)

map("v", "p", '"_dP', opts)

-- Ctrl + Shift + k to delete line
map({'x', 'v'}, '<C-K>', "<cmd>'<,'>d<CR>", { desc = "Delete lines" })
map("n", "<C-K>", "dd", { desc = "Delete line" })
map("i", "<C-K>", "<C-o>dd", { desc = "Delete line" })
map("i", "<A-BS>", "<C-w>", { desc = "Delete word left" })

-- Comment
map("n", "<C-_>", "gcc", { desc = "comment toggle", remap = true })
map("v", "<C-_>", "gc", { desc = "comment toggle", remap = true })
-- map("i", "<C-_>", "<Esc>gc", { desc = "comment toggle", remap = true })


-- Diagnostic keymaps
-- map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)










