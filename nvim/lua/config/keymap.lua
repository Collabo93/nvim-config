-- Move highlighted line up/down
vim.keymap.set("v", "J", ":silent! m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":silent! m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Cursor/screen centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Diagnostics
vim.keymap.set("n", "<leader>n", function()
    vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "<leader>N", function()
    vim.diagnostic.jump({ count = -1, float = true })
end)

-- Splits
vim.keymap.set("n", "<leader>v", function()
    vim.cmd("wincmd v")
    vim.cmd("wincmd l")
end)
vim.keymap.set("t", "<leader>v", function()
    vim.cmd("stopinsert")
    vim.cmd("wincmd v")
    vim.cmd("wincmd l")
    vim.cmd("terminal")
end)

-- jump to last and next location in jump list
vim.keymap.set("n", "<C-j>", "<C-o>", {
    desc = "Jump back"
})
vim.keymap.set("n", "<C-k>", "<C-i>", {
    desc = "Jump forward"
})

-- Move between splits
vim.keymap.set("n", "<leader>h", "<C-w><C-h>")
vim.keymap.set("n", "<leader>l", "<C-w><C-l>")
vim.keymap.set("t", "<leader>h", "<C-\\><C-n><C-w><C-h>")
vim.keymap.set("t", "<leader>l", "<C-\\><C-n><C-w><C-l>")

-- Visual block (Alt+v weil C-v im Terminal belegt)
vim.keymap.set("n", "<A-v>", "<C-v>", { noremap = true, silent = true })

-- Comment
vim.keymap.set("v", "#", function() vim.cmd.norm("gc") end)

-- Bracket selection
vim.keymap.set("n", "<leader>i", "vi(")
vim.keymap.set("n", "<leader>o", "vi'")

-- LSP
vim.keymap.set("n", "<leader>w", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>d", function() vim.lsp.buf.definition() end)

-- Misc
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<leader>^", ":b#<CR>", { noremap = true, silent = true })
