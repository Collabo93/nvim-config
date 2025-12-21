-- Add your project root directory here --
local projects_root = vim.fn.expand("~/Documents/repos/")

return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local alpha_config_path = vim.fn.stdpath("config") .. "\\lua\\plugins\\alpha.lua"

        -- header
        dashboard.section.header.val = {
            [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
            [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
            [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
            [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
            [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
            [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
            "",
            "         Neovim loaded 0/0 plugins in 0.00ms"
        }

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            once = true,
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                local lazy_line = "       Neovim loaded "
                    .. stats.loaded .. "/" .. stats.count
                    .. " plugins in " .. ms .. "ms"

                dashboard.section.header.val[8] = lazy_line

                pcall(vim.cmd.AlphaRedraw)
            end,
        })
        dashboard.section.header.opts.hl = "AlphaHeader"

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
                        icon = "  ",
                    })
                end
            end

            table.sort(dirs, function(a, b) return a.name:lower() < b.name:lower() end)
            return dirs
        end

        local buttons = {}
        local index = 1
        for _, proj in ipairs(get_projects()) do
            local shortcut = (index <= 9) and tostring(index) or string.sub(proj.name, 1, 1):lower()
            index = index + 1

            table.insert(buttons, {
                type = "button",
                val = proj.icon .. proj.name,
                on_press = function()
                    vim.cmd("cd " .. proj.path)
                    vim.cmd("lcd " .. proj.path)
                    vim.cmd.Ex()
                end,
                opts = {
                    position = "center",
                    align_shortcut = "right",
                    width = 42,
                    shortcut = shortcut,
                    hl = "AlphaButtons",
                    hl_shortcut = "AlphaShortcut",
                    keymap = { "n", shortcut, function()
                        vim.cmd("cd " .. proj.path)
                        vim.cmd("lcd " .. proj.path)
                        vim.cmd.Ex()
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
        dashboard.section.footer.val = "KEEP CALM & CARRY ON"
        dashboard.section.footer.opts.hl = "AlphaShortcut"

        -- build dashboard
        dashboard.config.layout = {
            { type = "padding", val = 4 },
            dashboard.section.header,
            { type = "padding", val = 8 },
            dashboard.section.buttons,
            { type = "padding", val = 4 },
            -- dashboard.section.footer,
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
    end,


}
