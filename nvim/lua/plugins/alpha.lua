local projects_root = vim.fn.expand("~/Documents/repos/")

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local alpha_config_path = vim.fn.stdpath("config") .. "\\lua\\plugins\\alpha.lua"
local zettelkasten_path = vim.fn.expand("$USERPROFILE") .. "\\Documents\\zettelkasten"

-- header
local fill = vim.fn.winheight(0) - 43
local logo = (fill >= 0 and [[



    ]] or '') ..
    [[
                                          
       ███████████           █████      ██
      ███████████             █████ 
      ████████████████ ███████████ ███   ███████
     ████████████████ ████████████ █████ ██████████████
    █████████████████████████████ █████ █████ ████ █████
  ██████████████████████████████████ █████ █████ ████ █████
 ██████  ███ █████████████████ ████ █████ █████ ████ ██████
 ██████   ██  ███████████████   ██ █████████████████

      ]]

local header_hl = {}
if fill >= 0 then
    table.insert(header_hl, { { "Red", 1, 1 } })
    table.insert(header_hl, { { "Red", 1, 1 } })
    table.insert(header_hl, { { "Red", 1, 1 } })
end
table.insert(header_hl, { { "AlphaHeader0_0", 46, 48 } }) -- Line 10
table.insert(header_hl, {                                 -- Line 11
    { "AlphaHeader1_0", 7,  22 },
    { "AlphaHeader1_1", 33, 40 },
    { "AlphaHeader1_2", 40, 50 }
})
table.insert(header_hl, { -- Line 12
    { "AlphaHeader2_0", 6,  21 },
    { "AlphaHeader2_1", 33, 45 },
})
table.insert(header_hl, { -- Line 13
    { "AlphaHeader3_0", 6,  19 },
    { "AlphaHeader3_1", 19, 20 },
    { "AlphaHeader3_2", 20, 35 },
    { "AlphaHeader3_3", 35, 45 },
    { "AlphaHeader3_4", 45, 90 },
})
table.insert(header_hl, { -- Line 14
    { "AlphaHeader4_0", 5,  18 },
    { "AlphaHeader4_1", 18, 36 },
    { "AlphaHeader4_2", 36, 45 },
    { "AlphaHeader4_3", 45, 90 }
})
table.insert(header_hl, { -- Line 15
    { "AlphaHeader5_0", 4,  17 },
    { "AlphaHeader5_1", 17, 24 },
    { "AlphaHeader5_2", 24, 28 },
    { "AlphaHeader5_3", 28, 37 },
    { "AlphaHeader5_4", 37, 46 },
    { "AlphaHeader5_5", 46, 90 },
})
table.insert(header_hl, { -- Line 16
    { "AlphaHeader6_0", 2,  17 },
    { "AlphaHeader6_1", 17, 38 },
    { "AlphaHeader6_2", 38, 45 },
    { "AlphaHeader6_3", 46, 90 },
})
table.insert(header_hl, { -- Line 17
    { "AlphaHeader7_0", 1,  17 },
    { "AlphaHeader7_1", 17, 38 },
    { "AlphaHeader7_2", 38, 45 },
    { "AlphaHeader7_3", 46, 90 },
})
table.insert(header_hl, { -- Line 18
    { "AlphaHeader8_0", 1,  37 },
    { "AlphaHeader8_1", 37, 91 },
})

-- N (Mauve)
vim.api.nvim_set_hl(0, "AlphaHeader1_0", { fg = "#775ba0" })
vim.api.nvim_set_hl(0, "AlphaHeader2_0", { fg = "#795da2" })
vim.api.nvim_set_hl(0, "AlphaHeader3_0", { fg = "#7b5fa4" })
vim.api.nvim_set_hl(0, "AlphaHeader4_0", { fg = "#7f63a8" })
vim.api.nvim_set_hl(0, "AlphaHeader5_0", { fg = "#8264ab" })
vim.api.nvim_set_hl(0, "AlphaHeader6_0", { fg = "#8566ad" })
vim.api.nvim_set_hl(0, "AlphaHeader7_0", { fg = "#8769b0" })
vim.api.nvim_set_hl(0, "AlphaHeader8_0", { fg = "#7d61a6" })

-- e, a (Mauve hell)
vim.api.nvim_set_hl(0, "AlphaHeader3_1", { fg = "#7f63a8" })
vim.api.nvim_set_hl(0, "AlphaHeader3_2", { fg = "#ccaaf7" })
vim.api.nvim_set_hl(0, "AlphaHeader4_1", { fg = "#cba8f7" })
vim.api.nvim_set_hl(0, "AlphaHeader5_1", { fg = "#cba6f7" })
vim.api.nvim_set_hl(0, "AlphaHeader5_2", { fg = "#7f63a8" })
vim.api.nvim_set_hl(0, "AlphaHeader5_3", { fg = "#cba6f7" })
vim.api.nvim_set_hl(0, "AlphaHeader6_1", { fg = "#c9a4f5" })
vim.api.nvim_set_hl(0, "AlphaHeader7_1", { fg = "#c7a2f3" })

-- V (Blue dunkel)
vim.api.nvim_set_hl(0, "AlphaHeader0_0", { fg = "#85b0f6" })
vim.api.nvim_set_hl(0, "AlphaHeader1_1", { fg = "#5185d1" })
vim.api.nvim_set_hl(0, "AlphaHeader1_2", { fg = "#85b0f6" })
vim.api.nvim_set_hl(0, "AlphaHeader2_1", { fg = "#5387d3" })
vim.api.nvim_set_hl(0, "AlphaHeader3_3", { fg = "#5589d5" })
vim.api.nvim_set_hl(0, "AlphaHeader4_2", { fg = "#5b8dd9" })
vim.api.nvim_set_hl(0, "AlphaHeader5_4", { fg = "#6093de" })
vim.api.nvim_set_hl(0, "AlphaHeader6_2", { fg = "#6496e0" })
vim.api.nvim_set_hl(0, "AlphaHeader7_2", { fg = "#6496e0" })

-- i, m, m (Blue hell)
vim.api.nvim_set_hl(0, "AlphaHeader3_4", { fg = "#85b0f6" })
vim.api.nvim_set_hl(0, "AlphaHeader4_3", { fg = "#87b2f8" })
vim.api.nvim_set_hl(0, "AlphaHeader5_5", { fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "AlphaHeader6_3", { fg = "#8cb6fa" })
vim.api.nvim_set_hl(0, "AlphaHeader7_3", { fg = "#8eb8fa" })
vim.api.nvim_set_hl(0, "AlphaHeader8_1", { fg = "#578bd7" })

local utils = require('alpha.utils')
local header_val = vim.split(logo, '\n')
header_hl = utils.charhl_to_bytehl(header_hl, header_val, false)

dashboard.section.header.opts.hl = header_hl
dashboard.section.header.val = header_val

local version = vim.version()
local versionStr = "  v" .. version.major .. "." .. version.minor .. "." .. version.patch
local infoSection = {
    type = "text",
    val = versionStr,
    opts = { position = "center", hl = "AlphaInfo" },
}

-- projects buttons
local function get_projects()
    local dirs = {}
    local p = vim.loop.fs_scandir(projects_root)
    if not p then return dirs end

    while true do
        local name, type = vim.loop.fs_scandir_next(p)
        if not name then break end
        if type == "directory" then
            local full_path = projects_root .. "/" .. name
            table.insert(dirs, {
                name = name,
                path = full_path,
                icon = "  ",
            })
        end
    end

    table.sort(dirs, function(a, b) return a.name:lower() < b.name:lower() end)
    return dirs
end

vim.api.nvim_set_hl(0, "AlphaButtonIcon", { fg = "#89b4fa" })
local buttons = {}
local index = 1
for _, proj in ipairs(get_projects()) do
    if index > 9 then break end
    local shortcut = tostring(index) or string.sub(proj.name, 1, 1):lower()
    index = index + 1

    table.insert(buttons, {
        type = "button",
        val = proj.icon .. proj.name,
        on_press = function()
            vim.cmd("cd " .. proj.path)
            vim.cmd("lcd " .. proj.path)
            require("oil").open(vim.fn.expand("%:p:h"))
        end,
        opts = {
            position = "center",
            align_shortcut = "right",
            width = 42,
            shortcut = shortcut,
            hl = {
                { "AlphaButtonIcon", 0, 5 },  -- Icon blau
                { "AlphaButtons",    5, -1 }, -- Projektname in alter Farbe
            },
            hl_shortcut = "AlphaShortcut",
            keymap = { "n", shortcut, function()
                vim.cmd("cd " .. proj.path)
                vim.cmd("lcd " .. proj.path)
                require("oil").open(vim.fn.expand("%:p:h"))
            end, { noremap = true, silent = true } },
        },
    })
end



if #buttons == 0 then
    table.insert(buttons, {
        type = "text",
        val = "No project found in " ..
            projects_root ..
            "\nAdd your root project folder in: " .. alpha_config_path,
        opts = { position = "center", hl = "ErrorMsg", shrink_margin = false },
    })
end

dashboard.section.buttons.val = buttons

--footer
local zettel_button = {
    type = "button",
    val = "  Zettelkasten ",
    on_press = function()
        local path = zettelkasten_path
        vim.cmd("cd " .. path)
        vim.cmd("lcd " .. path)
        require("oil").open(path)
    end,
    opts = {
        position = "center",
        align_shortcut = "right",
        shortcut = "Z",
        hl = {
            { "AlphaButtonIcon", 0, 5 },
        },
        hl_shortcut = "AlphaShortcut",
        keymap = {
            "n",
            "Z",
            function()
                local path = zettelkasten_path
                vim.cmd("cd " .. path)
                vim.cmd("lcd " .. path)
                require("oil").open(path)
            end,
            { noremap = true, silent = true }
        },
    },
}
dashboard.section.footer.val = "KEEP CALM & CARRY ON"
dashboard.section.footer.opts.hl = "AlphaShortcut"

-- build dashboard
dashboard.config.layout = {
    { type = "padding", val = 0 },
    dashboard.section.header,
    { type = "padding", val = 0 },
    infoSection,
    { type = "padding", val = 2 },
    zettel_button,
    { type = "padding", val = 6 },
    dashboard.section.buttons,
    { type = "padding", val = 4 },
    dashboard.section.footer,
}

alpha.setup(dashboard.config)
local draw_orig = alpha.draw
alpha.draw = function(conf, state, ...)
    if not vim.api.nvim_buf_is_valid(state.buffer) then
        print("Buffer not valid")
        return
    end
    draw_orig(conf, state, ...)
end

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
            alpha.start(true)
        end
    end,
})
