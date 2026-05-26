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
