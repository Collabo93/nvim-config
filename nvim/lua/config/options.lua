-- Show absolute and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = "unnamedplus"

-- Always show the sign column
vim.opt.signcolumn = "yes"


-- Always split right, never below
vim.opt.splitright = true
vim.opt.splitbelow = false

-- Highlight the current line
vim.opt.cursorline = true

-- Enable true color support
vim.opt.termguicolors = true

-- 4-space tabs, expand to spaces, smart indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- No line wrap, no swapfile, no backup, but persistent undo
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- No highlight on search, but show matches while typing
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Keep 8 lines visible above/below cursor when scrolling
vim.opt.scrolloff = 8

-- Allow @ in filenames
vim.opt.isfname:append("@-@")

-- Faster update time for CursorHold events
vim.opt.updatetime = 50

-- Single global statusline
vim.opt.laststatus = 3

-- Replace ~ at end of buffer with a space
vim.opt.fillchars:append({ eob = " " })

-- Suppress "N lines changed" messages
vim.opt.report = 9999
