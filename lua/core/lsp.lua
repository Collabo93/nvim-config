vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
            },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.enable({ 'biome', 'lua_ls', 'ts_ls', 'intelephense' })

-- Diagnostics
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
        format = function(diagnostic)
            local icons = { "Error ", "Warn ", "Info ", "Hint " }
            return icons[diagnostic.severity] .. diagnostic.message
        end,
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,

    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
        },
    },
})
