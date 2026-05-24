---@brief
--- https://biomejs.dev
---
--- Toolchain of the web. [Successor of Rome](https://biomejs.dev/blog/annoucing-biome).
---
--- ```sh
--- npm install [-g] @biomejs/biome
--- ```
---
--- ### Monorepo support
---
--- `biome` supports monorepos by default. It will automatically find the `biome.json` corresponding to the package you are working on, as described in the [documentation](https://biomejs.dev/guides/big-projects/#monorepo). This works without the need of spawning multiple instances of `biome`, saving memory.

-- local util = require 'lspconfig.util'

-- config from: https://www.reddit.com/r/neovim/comments/1of6lzt/comment/nl7bnhr/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
return {
    cmd = { "biome", "lsp-proxy" },
    filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "svelte",
        "typescript",
        "typescriptreact",
    },
    root_markers = { "biome.json", "biome.jsonc" },
    workspace_required = true,

    -- NOTE: dynamic capabilities are kind of a hassle.
    -- https://github.com/neovim/neovim/issues/24229
    capabilities = {
        textDocument = {
            formatting = {
                dynamicRegistration = false,
            },
        },
    },
}
