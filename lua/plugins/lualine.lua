local c = require("catppuccin.palettes").get_palette("mocha")

local function gradient(accent)
    return {
        b = { bg = c.surface0, fg = accent },
        c = { bg = "NONE", fg = c.subtext1 },
    }
end

local catppuccin_lualine = {
    normal = {
        a = { bg = c.blue, fg = c.base, gui = "bold" },
        b = gradient(c.blue).b,
        c = gradient(c.blue).c,
    },
    insert = {
        a = { bg = c.red, fg = c.base, gui = "bold" },
        b = gradient(c.red).b,
        c = gradient(c.red).c,
    },
    visual = {
        a = { bg = c.mauve, fg = c.base, gui = "bold" },
        b = gradient(c.mauve).b,
        c = gradient(c.mauve).c,
    },
    replace = {
        a = { bg = c.green, fg = c.base, gui = "bold" },
        b = gradient(c.green).b,
        c = gradient(c.green).c,
    },
    command = {
        a = { bg = c.yellow, fg = c.base, gui = "bold" },
        b = gradient(c.yellow).b,
        c = gradient(c.yellow).c,
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
        disabled_filetypes = { "alpha" },
    },
    sections = {
        lualine_b = { "branch" },
        lualine_c = {
            {
                "filename",
                path = 1,
                cond = function()
                    return vim.bo.filetype ~= "oil"
                end,
            }
        },
        lualine_x = {},
        lualine_y = { "diagnostics" },
        lualine_z = {
            {
                "filetype",
                colored = false, -- Icon erbt die Farbe von color.fg
                color = { fg = "#000000" },
            }
        },
    },
})
