-- Exit current file and open oil
vim.keymap.set("n", "<leader>q", function()
    -- netrw default
    -- vim.cmd.Ex()
    if vim.bo.filetype == "oil" then
        vim.cmd("Oil")
    else
        -- in normalem File: öffne Oil im File-Verzeichnis
        require("oil").open(vim.fn.expand("%:p:h"))
    end
end)

-- move highlighted line up/down
vim.keymap.set("v", "J", ":silent! m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":silent! m '<-2<CR>gv=gv", { noremap = true, silent = true })

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
vim.keymap.set("t", "<leader>v", function()
    vim.cmd("stopinsert")
    vim.cmd("wincmd v")
    vim.cmd("wincmd l")
    vim.cmd("terminal")
end, { desc = "Vertical split and move right (terminal)" })

-- move between splits
vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("t", "<leader>h", "<C-\\><C-n><C-w><C-h>", { desc = "Move focus to the left window (terminal)" })
vim.keymap.set("t", "<leader>l", "<C-\\><C-n><C-w><C-l>", { desc = "Move focus to the right window (terminal)" })

-- visual block mode with Alt + v, since Ctrl + v is used for pasting in terminal
vim.keymap.set("n", "<A-v>", "<C-v>", { noremap = true, silent = true })


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
    require("undotree").open()
end, { desc = "Open UndoTree" })


-- Select all text in the current buffer
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Redo binding
vim.keymap.set('n', 'U', '<C-r>', { desc = 'Redo' })

-- Plugin keymaps
vim.keymap.set("n", "<leader>p", "<cmd>Alpha<cr>", { desc = "Dashboard" }) -- Reopen dashboard
vim.keymap.set({ "n", "t" }, "<leader>c", function()
    local wins = vim.api.nvim_list_wins()
    local term_wins = {}
    for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype == "terminal" then
            table.insert(term_wins, win)
        end
    end

    if #term_wins > 0 then
        for _, win in ipairs(term_wins) do
            vim.api.nvim_win_close(win, true)
        end
    else
        vim.cmd("ToggleTerm")
    end
end, { desc = "Toggle terminal" })

-- telescope
vim.api.nvim_create_user_command("GrepPrompt", function()
    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, {})
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>e", "<cmd>GrepPrompt<cr>", { desc = "Telescope live grep (prompt)" })

-- hide operation of multiple line changes
vim.opt.report = 9999

-- toogle diffview
local function toggle_diffview()
    local lib = require("diffview.lib")
    local view = lib.get_current_view()

    if view then
        vim.cmd("DiffviewClose")
    else
        vim.cmd("DiffviewOpen HEAD")
    end
end

vim.keymap.set("n", "<leader>g", toggle_diffview, { desc = "[G]it Diffview toggle" })

-- jump to definition
vim.keymap.set("n", "<leader>d", function() vim.lsp.buf.definition() end, { desc = "Go to definition" })

-- jump to previous buffer
vim.keymap.set("n", "<leader>^", ":b#<CR>", { noremap = true, silent = true })
