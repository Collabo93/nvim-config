return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = { "node_modules", "%.git/" },
                mappings = {
                    i = {
                        ["J"] = actions.move_selection_next,
                        ["K"] = actions.move_selection_previous,
                    },
                },
            },
        })
    end,
}
