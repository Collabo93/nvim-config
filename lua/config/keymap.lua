local function close_floating()
    local inactive_floating_wins = vim.fn.filter(vim.api.nvim_list_wins(), function(k, v)
        local file_type = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(v), "filetype")

        return vim.api.nvim_win_get_config(v).relative ~= ""
            and v ~= vim.api.nvim_get_current_win()
            and file_type ~= "hydra_hint"
    end)
    for _, w in ipairs(inactive_floating_wins) do
        pcall(vim.api.nvim_win_close, w, false)
    end
end

-- Exit current file and navigate cursor to it
vim.keymap.set("n", "<leader>q", function()
    vim.cmd.Ex()

    local current_file = vim.fn.expand("%:t")
    if current_file ~= "" then
        vim.fn.search(current_file)
    end
    close_floating()
end)

-- move highlighted line up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- place screen and cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep copy in clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- jump to prev/next error
vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>N", vim.diagnostic.goto_prev)

-- Open/Close splits screen, based on if there is already one
vim.keymap.set("n", "<leader>v", function()
    vim.cmd("wincmd v")
    vim.cmd("wincmd l")
end, { desc = "Move focus to the left window or close the right window" })

-- move between splits
vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" })

-- comment highlight
vim.keymap.set("v", "#", function()
    vim.cmd.norm("gc")
end)

-- bracket and brace selection
vim.keymap.set("n", "<leader>i", "vi(")
vim.keymap.set("n", "<leader>o", "vi'")

-- format current buffer
vim.keymap.set("n", "<leader>w", vim.lsp.buf.format)

-- UndotreeToggle
vim.keymap.set("n", "<leader>u", function()
    vim.cmd("UndotreeToggle")
    vim.cmd("UndotreeFocus")
end, { desc = "Toggle and focus Undotree" })

-- Select all text in the current buffer
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Redo binding
vim.keymap.set('n', 'U', '<C-r>', { desc = 'Redo' })

-- Plugin keymaps
vim.keymap.set("n", "<leader>p", "<cmd>Alpha<cr>", { desc = "Dashboard" })                     -- Reopen dashboard
vim.keymap.set({ "n", "t" }, "<leader>c", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" }) -- Toggle terminal

-- telescope
vim.api.nvim_create_user_command("GrepPrompt", function()
    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, {})
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>e", "<cmd>GrepPrompt<cr>", { desc = "Telescope live grep (prompt)" })

-- toogle diffview
local function toggle_diffview()
    local lib = require("diffview.lib")
    local view = lib.get_current_view()

    if view then
        vim.cmd("DiffviewClose")
    else
        vim.cmd("DiffviewOpen HEAD")
        -- vim.cmd("DiffviewOpen")
    end
end

vim.keymap.set("n", "<leader>g", toggle_diffview, { desc = "[G]it Diffview toggle" })
