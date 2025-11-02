vim.g.mapleader = " "

vim.keymap.set("n", "<leader>p", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>sq", ":wq<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>fq", ":qa!<CR>")
vim.keymap.set("n", "<leader>o", "<C-o>")
vim.keymap.set("n", "<leader>i", "<C-i>")
vim.keymap.set("n", "<leader>d", ":bd!<CR>")
vim.keymap.set("n", "<leader>sd", ":bd<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gu", vim.lsp.buf.references)
vim.keymap.set("n", "rr", vim.lsp.buf.rename)

vim.keymap.set("t", "<C-w>", "<C-\\><C-n>")

--vim.keymap.set("i", "kk", "<C-c>")

vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
end)
