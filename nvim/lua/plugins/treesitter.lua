local parsers = {
    "lua", "luadoc", "vim", "vimdoc",
    "javascript", "typescript", "tsx", "jsdoc",
    "html", "css", "scss", "jsdoc",
    "php", "phpdoc",
    "json", "bash",
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = parsers,
    callback = function()
        vim.treesitter.start()
    end,
})

require("nvim-treesitter").install(parsers)
