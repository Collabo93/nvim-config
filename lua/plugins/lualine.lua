return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        local c = require("catppuccin.palettes").get_palette("mocha")

        local catppuccin_lualine = {
            normal = {
                a = { bg = c.blue, fg = c.base, gui = "bold" },
                b = { bg = "NONE", fg = c.text },
                c = { bg = "NONE", fg = c.subtext1 },
            },

            insert = {
                a = { bg = c.red, fg = c.base, gui = "bold" },
                b = { bg = "NONE", fg = c.text },
                c = { bg = "NONE", fg = c.text },
            },

            visual = {
                a = { bg = c.mauve, fg = c.base, gui = "bold" },
                b = { bg = "NONE", fg = c.text },
                c = { bg = "NONE", fg = c.text },
            },

            replace = {
                a = { bg = c.green, fg = c.base, gui = "bold" },
                b = { bg = "NONE", fg = c.text },
                c = { bg = "NONE", fg = c.text },
            },

            command = {
                a = { bg = c.yellow, fg = c.base, gui = "bold" },
                b = { bg = "NONE", fg = c.text },
                c = { bg = "NONE", fg = c.text },
            },

            inactive = {
                a = { bg = c.mantle, fg = c.overlay1, gui = "bold" },
                b = { bg = "NONE", fg = c.overlay1 },
                c = { bg = "NONE", fg = c.overlay0 },
            },
        }

        require("lualine").setup({
            options = {
                theme = catppuccin_lualine,
                disabled_filetypes = { 'alpha' },
            },

            sections = {
                lualine_x = { 'filetype' },
            },
        })
    end
}
