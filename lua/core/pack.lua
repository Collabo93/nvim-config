vim.pack.add({
    -- alpha-nvim, oil
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    --blink-cmp, luaSnip
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    -- telescope,todo-comments
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    -- blink-cmp
    { src = "https://github.com/saghen/blink.lib" },

    -- **plugins**
    -- **prio 1000**
    {
        src = "https://github.com/catppuccin/nvim",
        name = "catppuccin"
    },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },

    -- **plugins**
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
    { src = "https://github.com/goolord/alpha-nvim" },
    {
        src = "https://github.com/saghen/blink.cmp",
        version = "v1.6.0"
    },
    { src = "https://github.com/github/copilot.vim" },
    { src = "https://github.com/sindrets/diffview.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/mawkler/modicator.nvim" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/folke/todo-comments.nvim" },
    { src = "https://github.com/akinsho/toggleterm.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/rachartier/tiny-cmdline.nvim" },
    { src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
})

require("vim._core.ui2").enable({})

require('plugins.devicons')
require('plugins.treesitter')
require('plugins.alpha')
require('plugins.blink')
require('plugins.catppuccin')
require('plugins.diffview')
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.modicator')
require('plugins.luasnip')
require('plugins.telescope')
require('plugins.toogleterm')
require('plugins.oil')
require('plugins.cmdline')
require('plugins.copilotchat')
