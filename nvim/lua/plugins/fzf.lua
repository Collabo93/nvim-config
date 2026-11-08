-- fzf-lua
local fzf = require("fzf-lua")

local ignore = { "node_modules", "[/\\]%.git[/\\]" }

if vim.fn.has("win32") == 1 then
    vim.list_extend(ignore, { "^dist[/\\]", "[/\\]dist[/\\]" })
end

fzf.setup({
    file_ignore_patterns = ignore,
    fzf_opts = {
        ["--layout"] = "default",
    },
    winopts = {
        on_create = function()
            local opts = { buffer = true, silent = true, nowait = true }
            vim.keymap.set("t", "J", "<Down>", opts)
            vim.keymap.set("t", "K", "<Up>", opts)
        end,
    },
})
