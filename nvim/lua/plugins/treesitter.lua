local treesitter = require("nvim-treesitter")
local ensure_installed = {
    "lua", "luadoc", "vim", "vimdoc",
    "javascript", "typescript", "tsx", "jsdoc",
    "html", "css", "scss", "jsdoc",
    "php", "phpdoc",
    "json", "bash",
}

treesitter.install(ensure_installed)
