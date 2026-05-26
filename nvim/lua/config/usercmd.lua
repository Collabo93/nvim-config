-- zettelkasten
vim.keymap.set("n", "<leader>z", function()
    local title = vim.fn.input("Note title: ")

    if title == "" then
        print("Cancelled")
        return
    end

    -- === CONFIG ===
    local zk_dir = vim.fn.expand("$USERPROFILE") .. "\\Documents\\zettelkasten"
    vim.fn.mkdir(zk_dir, "p")

    -- === SLUG ===
    local slug = title:lower()
        :gsub("%s+", "-")
        :gsub("[^a-z0-9%-]", "")

    local file = zk_dir .. "\\" .. slug .. ".md"

    -- === DUPLICATE CHECK ===
    if vim.fn.filereadable(file) == 1 then
        print("Note exists, opening...")
        vim.cmd("edit " .. file)
        return
    end

    -- === DATE ===
    local date = os.date("%Y-%m-%d")

    -- === TEMPLATE ===
    local content = table.concat({
        "---",
        'title: "' .. title .. '"',
        "date: " .. date,
        "tags:",
        "-",
        "---",
        "",
        "# " .. title,
        "",
    }, "\n")

    -- === WRITE FILE ===
    vim.fn.writefile(vim.split(content, "\n"), file)

    -- === OPEN FILE ===
    vim.cmd("edit " .. file)
end, { desc = "Create Zettelkasten note" })
