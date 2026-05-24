vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = 'rounded',
        max_height = 7,
        max_width = 80,
        focusable = false,
        close_events = { 'CursorMoved', 'BufHidden', 'InsertLeave' },
    }
)
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

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/completion') then
            local chars = {}
            for i = 32, 126 do table.insert(chars, string.char(i)) end
            local exclude = { ['('] = true, [','] = true, [')'] = true }
            chars = vim.tbl_filter(function(c) return not exclude[c] end, chars)
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        if client:supports_method('textDocument/signatureHelp') then
            vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { buffer = ev.buf })
            vim.api.nvim_create_autocmd('TextChangedI', {
                buffer = ev.buf,
                callback = function()
                    local line = vim.api.nvim_get_current_line()
                    local col = vim.api.nvim_win_get_cursor(0)[2]
                    local char = line:sub(col, col)
                    if char == '(' or char == ',' then
                        vim.lsp.buf.signature_help()
                    end
                end,
            })
        end
    end,
})

local ok, catppuccin = pcall(require, "catppuccin.palettes")
if ok then
    local colors = catppuccin.get_palette("mocha")
    vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', {
        bold = true,
        underline = true,
        fg = colors.peach,
        bg = colors.surface1,
    })
end
