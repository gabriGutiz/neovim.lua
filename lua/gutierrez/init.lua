require("gutierrez.remap")
require("gutierrez.lazy_init")
require("gutierrez.temp_file")

local g = vim.g
local opt = vim.opt

vim.cmd.colorscheme("rose-pine-moon")
-- vim.cmd.colorscheme("neomodern")

g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

opt.showmatch = true -- highlight matching parenthesis
opt.colorcolumn = "90" -- column maker
opt.ignorecase = true -- ignore case letters for seach

vim.wo.relativenumber = true
vim.wo.number = true

opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- tab size
opt.smartindent = true -- autoindent new lines

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_set_hl(0, "ExtraWhitespace", { ctermbg = "darkred", bg = "darkred" })

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
    end,
})
