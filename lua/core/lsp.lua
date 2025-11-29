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

-- LSP Completion
-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(ev)
--         local client = vim.lsp.get_client_by_id(ev.data.client_id)
--         if not client then return end
--
--         vim.schedule(function()
--             if client.server_capabilities.completionProvider then
--                 vim.bo[ev.buf].completeopt = 'menu,menuone,noinsert,noselect'
--
--                 vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--
--                 local function map(key, direction)
--                     vim.keymap.set('i', key, function()
--                         if vim.fn.pumvisible() == 1 then
--                             return direction == 'down'
--                                 and '<C-n>'
--                                 or '<C-p>'
--                         else
--                             return key
--                         end
--                     end, { expr = true, buffer = ev.buf })
--                 end
--
--                 map('<S-j>', 'down')
--                 map('<S-k>', 'up')
--             end
--         end)
--     end,
-- })


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
