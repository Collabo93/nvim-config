-- show a quick highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) ",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Start Neovim in the config directory
if vim.fn.argc() == 0 then
    vim.api.nvim_set_current_dir(vim.fn.stdpath("config"))
end
