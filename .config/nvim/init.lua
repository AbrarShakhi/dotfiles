local basic = {
    "abrarshakhi.config.options",
    "abrarshakhi.config.keymaps",
    "abrarshakhi.config.plugman",
    "abrarshakhi.config.autocmd",
}
local extra = {
    "extras",
}

if vim.g.vscode then
    require("abrarshakhi.config.options")
    require("abrarshakhi.config.keymaps")
    require("abrarshakhi.config.autocmd")
else
    for _, item in ipairs(basic) do
        require(item)
    end
end

for _, item in ipairs(extra) do
        require(item)
end