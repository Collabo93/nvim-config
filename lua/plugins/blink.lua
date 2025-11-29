return {
    "saghen/blink.cmp",
    version = "v1.8.0",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        require("blink.cmp").setup({
            enabled = function()
                local disabled = { "netrw", "alpha" }
                return not vim.tbl_contains(disabled, vim.bo.filetype)
                    and vim.bo.buftype ~= "prompt"
            end,
            signature = { enabled = true },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 500 },
                menu = {
                    auto_show = true,
                    draw = {
                        treesitter = { "lsp" },
                        columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
                    },
                },
            },
            keymap = {
                preset = 'enter',
                ["<S-J>"] = { "select_next", "fallback" },
                ["<S-k>"] = { "select_prev", "fallback" },
            }
        })
    end,
}
