-- Oil
vim.keymap.set("n", "<leader>q", function()
    if vim.bo.filetype == "oil" then
        vim.cmd("Oil")
    else
        require("oil").open(vim.fn.expand("%:p:h"))
    end
end)

-- Alpha Dashboard
vim.keymap.set("n", "<leader>p", "<cmd>Alpha<cr>")

-- ToggleTerm
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
end)

-- Telescope
vim.api.nvim_create_user_command("GrepPrompt", function()
    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, {})
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>GrepPrompt<cr>")

-- Diffview
local function toggle_diffview()
    local view = require("diffview.lib").get_current_view()
    if view then
        vim.cmd("DiffviewClose")
    else
        vim.cmd("DiffviewOpen HEAD")
    end
end
vim.keymap.set("n", "<leader>g", toggle_diffview)

-- Undotree
vim.keymap.set("n", "<leader>u", function()
    require("undotree").open()
end)

-- CopilotChat
vim.keymap.set("n", "<leader>x", "<cmd>CopilotChatToggle<cr>")

-- fugitive
local function toggle_fugitive()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype

    if ft == "fugitive" then
      vim.api.nvim_win_close(win, true)
      return
    end
  end

  vim.cmd("Git")
end

vim.keymap.set("n", "<leader>r", toggle_fugitive)
