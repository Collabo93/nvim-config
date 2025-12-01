return {
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
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

            -- Alpha-Highlights mit Catppuccin-Farben (perfekt für Mocha + transparent)
            vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = c.mauve, bold = true })  -- lila/pink – super für Shortcuts
            vim.api.nvim_set_hl(0, "AlphaButtons",  { fg = c.text })               -- lavendel/text – für Button-Text
            vim.api.nvim_set_hl(0, "AlphaHeader",   { fg = c.lavender })
        end,
    },
}
