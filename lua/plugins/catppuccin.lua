require("catppuccin").setup({
    transparent_background = true,
    color_overrides = {
        mocha = {
            base = "#14161B",
        },
    },
    float = {
        transparent = true,
    },
})
vim.cmd([[ colorscheme catppuccin-mocha ]])

local c = require("catppuccin.palettes").get_palette("mocha")

vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = c.mauve, bold = true })
vim.api.nvim_set_hl(0, "AlphaButtons", { fg = c.text })
vim.api.nvim_set_hl(0, "AlphaHeader", { fg = c.lavender })
