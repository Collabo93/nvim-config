return {
    'mawkler/modicator.nvim',
    after = 'catppuccin.nvim', -- Add your colorscheme plugin here
    config = function()
        require('modicator').setup({
            show_warnings = false,
        })
    end
}
