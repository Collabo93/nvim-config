vim.opt.complete = "o,.,w,b,u"
vim.opt.completeopt = "fuzzy,menuone,noselect,popup"
vim.opt.pumheight = 7
vim.opt.pummaxwidth = 80
vim.opt.pumborder = 'rounded'

vim.keymap.set('i', '<S-j>', function()
    return vim.fn.pumvisible() == 1 and '<C-n>' or '<S-j>'
end, { expr = true })

vim.keymap.set('i', '<S-k>', function()
    return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-k>'
end, { expr = true })
